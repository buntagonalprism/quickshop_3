import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/checklist_entry.dart';
import '../models/list_summary.dart';
import '../models/user_sortable.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'list_leave_in_progress_repo.dart';
import 'user_repo.dart';

part 'checklist_entry_repo.g.dart';

/// When adding items to a checklist, they may either be added to the start or end of the list.
enum ChecklistAddPosition {
  start,
  end,
}

@riverpod
class ChecklistEntryRepo extends _$ChecklistEntryRepo {
  @override
  Stream<List<ChecklistEntry>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressRepoProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    final fs = ref.watch(firestoreProvider);
    return fs.collection('lists/$listId/items').snapshots().map((snapshot) {
      final entries = snapshot.docs.map(_fromFirestore);
      return entries.toList()..userSort();
    });
  }

  Future<void> addItem(String itemName, ChecklistAddPosition position) async {
    return switch (position) {
      ChecklistAddPosition.start => _addItemAtIndex(itemName, 0),
      ChecklistAddPosition.end => _addItemAtIndex(itemName, state.requireValue.length),
    };
  }

  Future<void> addItemAfter(String itemName, ChecklistEntry afterEntry) async {
    final entries = state.requireValue;
    final index = entries.indexOf(afterEntry);
    return _addItemAtIndex(itemName, index + 1);
  }

  Future<void> _addItemAtIndex(String itemName, int index) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    final entries = state.requireValue;
    final insertUpdates = _KeyInsertUpdates(entries, index);

    final newItem = ChecklistItem(
      id: '',
      name: itemName,
      completed: false,
      sortKey: insertUpdates.insertKey,
    );

    final itemDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(itemDoc, _itemToFirestore(newItem));
    _makeDuplicateUpdates(fs, batch, insertUpdates);

    batch.update(listDoc, {
      ListSummary.fields.itemCount: FieldValue.increment(1),
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemCreated());
    _logIfDuplicateKeysFound(insertUpdates);
  }

  Future<void> addHeading(String headingName, ChecklistAddPosition position) async {
    return switch (position) {
      ChecklistAddPosition.start => _addHeadingAtIndex(headingName, 0),
      ChecklistAddPosition.end => _addHeadingAtIndex(headingName, state.requireValue.length),
    };
  }

  Future<void> addHeadingAfter(String itemName, ChecklistEntry afterEntry) async {
    final entries = state.requireValue;
    final index = entries.indexOf(afterEntry);
    return _addHeadingAtIndex(itemName, index + 1);
  }

  Future<void> _addHeadingAtIndex(String headingName, int index) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    final entries = state.requireValue;
    final insertUpdates = _KeyInsertUpdates(entries, index);

    final newHeading = ChecklistHeading(
      id: '',
      name: headingName,
      sortKey: insertUpdates.insertKey,
    );
    final headingDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(headingDoc, _headingToFirestore(newHeading));
    _makeDuplicateUpdates(fs, batch, insertUpdates);
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingCreated());
    _logIfDuplicateKeysFound(insertUpdates);
  }

  Future<void> toggleItem(ChecklistItem item) {
    final fs = ref.read(firestoreProvider);
    return fs.doc('lists/$listId/items/${item.id}').update({
      _Fields.completed: !item.completed,
    });
  }

  Future<void> removeItem(ChecklistItem item) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final itemDoc = fs.doc('lists/$listId/items/${item.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.delete(itemDoc);
    batch.update(listDoc, {
      ListSummary.fields.itemCount: FieldValue.increment(-1),
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemDeleted());
  }

  Future<void> removeHeading(ChecklistHeading heading) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.delete(headingDoc);
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingDeleted());
  }

  Future<void> moveEntry(ChecklistEntry entry, int newIndex) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    // Remove the item from its current position and get the sort key to insert it at the new index
    final entries = state.requireValue.toList();
    final currentIndex = entries.indexOf(entry);
    entries.removeAt(currentIndex);

    final insertUpdates = _KeyInsertUpdates(entries, newIndex);

    // Make the change immediately in memory
    entries.insert(newIndex, entry);
    state = AsyncValue.data(entries);

    final entryDoc = fs.doc('lists/$listId/items/${entry.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(entryDoc, {
      _Fields.sortKey: insertUpdates.insertKey.toJson(),
    });
    _makeDuplicateUpdates(fs, batch, insertUpdates);
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistEntryMoved());
    _logIfDuplicateKeysFound(insertUpdates);
  }

  void _makeDuplicateUpdates(FirebaseFirestore fs, WriteBatch batch, _KeyInsertUpdates updates) {
    for (var update in updates.duplicateKeyUpdates) {
      final updateDoc = fs.doc('lists/$listId/items/${update.entry.id}');
      batch.update(updateDoc, {
        _Fields.sortKey: update.newSortKey.toJson(),
      });
    }
  }

  Future<void> editItem(ChecklistItem item, String newName) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final itemDoc = fs.doc('lists/$listId/items/${item.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(itemDoc, {
      _Fields.name: newName.trim(),
    });
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemUpdated());
  }

  Future<void> editHeading(ChecklistHeading heading, String newName) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(headingDoc, {
      _Fields.name: newName.trim(),
    });
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingUpdated());
  }

  Future<void> uncheckAll() async {
    if (!state.hasValue) {
      throw StateError('Cannot uncheck items from a list that has not been loaded');
    }
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final batch = fs.batch();
    final entries = state.requireValue;
    for (var entry in entries) {
      entry.maybeWhen(
        item: (item) {
          if (item.completed) {
            batch.update(fs.doc('lists/$listId/items/${item.id}'), {
              _Fields.completed: false,
            });
          }
        },
        orElse: () {},
      );
    }
    batch.update(fs.doc('lists/$listId'), {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemsBatchUnchecked());
  }

  Future<void> removeCheckedItems() async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final entries = state.requireValue;
    final batch = fs.batch();
    int itemsRemoved = 0;
    entries.forEachIndexed((index, entry) {
      entry.when(
        item: (item) {
          if (item.completed) {
            final itemDoc = fs.doc('lists/$listId/items/${item.id}');
            batch.delete(itemDoc);
            itemsRemoved++;
          }
        },
        heading: (heading) {
          final hasUncompletedItem = _headingHasUncompletedItem(entries, heading);
          if (!hasUncompletedItem) {
            final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
            batch.delete(headingDoc);
          }
        },
      );
    });
    if (itemsRemoved > 0) {
      final listDoc = fs.doc('lists/$listId');
      batch.update(listDoc, {
        ListSummary.fields.itemCount: FieldValue.increment(-itemsRemoved),
        '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
      });
      await batch.commit();
      ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemsBatchDeleted());
    }
  }

  /// Checks to see if there is an uncomplete item below the given heading, before the next heading
  /// or the end of the list.
  bool _headingHasUncompletedItem(List<ChecklistEntry> entries, ChecklistHeading heading) {
    final headingIndex = entries.indexOf(heading.asEntry);
    for (var i = headingIndex + 1; i < entries.length; i++) {
      final entry = entries[i];
      final isUncompletedItem =
          entry.maybeWhen(item: (item) => !item.completed, orElse: () => false);
      if (isUncompletedItem) {
        return true;
      }
      final isHeading = entry.maybeWhen(heading: (_) => true, orElse: () => false);
      if (isHeading) {
        return false;
      }
    }
    return false;
  }

  void _logIfDuplicateKeysFound(_KeyInsertUpdates updates) {
    final duplicates = updates.duplicateKeyUpdates;
    if (duplicates.isNotEmpty) {
      final event = AnalyticsEvent.checklistDuplicateSortKeysDetected(duplicates.length);
      ref.read(analyticsProvider).logEvent(event);
    }
  }
}

/// Represents the set of updates that need to be made when inserting an entry into a list.
class _KeyInsertUpdates {
  _KeyInsertUpdates(List<ChecklistEntry> entries, int insertIndex)
      : _entries = entries,
        _insertIndex = insertIndex {
    if (_willInsertBetweenDuplicateKeys()) {
      _handleInsertBetweenDuplicateKeys();
    } else {
      duplicateKeyUpdates = [];
      insertKey = _getSortKeyForNonDuplicateInsert();
    }
  }
  late final List<_DuplicateKeyUpdate> duplicateKeyUpdates;
  late final UserSortKey insertKey;

  final List<ChecklistEntry> _entries;
  final int _insertIndex;

  bool _willInsertBetweenDuplicateKeys() {
    if (_insertIndex <= 0 || _insertIndex >= _entries.length) {
      return false;
    }
    if (_entries.length <= 1) {
      return false;
    }
    final previous = _entries[_insertIndex - 1];
    final next = _entries[_insertIndex];
    return previous.sortKey == next.sortKey;
  }

  void _handleInsertBetweenDuplicateKeys() {
    final key = _entries[_insertIndex].sortKey;
    final entriesWithDuplicateKeys = _entries.where((entry) => entry.sortKey == key).toList();
    final subdividedKeys = key.subdivide(entriesWithDuplicateKeys.length + 1);
    final firstDuplicateIndex = _entries.indexOf(entriesWithDuplicateKeys.first);
    insertKey = subdividedKeys[_insertIndex - firstDuplicateIndex];
    subdividedKeys.removeAt(_insertIndex - firstDuplicateIndex);
    duplicateKeyUpdates = entriesWithDuplicateKeys.mapIndexed((index, entry) {
      return _DuplicateKeyUpdate(entry, subdividedKeys[index]);
    }).toList();
  }

  UserSortKey _getSortKeyForNonDuplicateInsert() {
    if (_entries.isEmpty) {
      return const UserSortKey(
        primary: 0,
        secondary: '',
      );
    }
    if (_insertIndex <= 0) {
      return UserSortKey(
        primary: _entries[0].sortKey.primary - 1,
        secondary: '',
      );
    }
    if (_insertIndex >= _entries.length) {
      return UserSortKey(
        primary: _entries[_entries.length - 1].sortKey.primary + 1,
        secondary: '',
      );
    }
    return UserSortKey.between(
      _entries[_insertIndex - 1].sortKey,
      _entries[_insertIndex].sortKey,
    );
  }
}

/// Represents an update that needs to be made to an existing entry due to a duplicate key
class _DuplicateKeyUpdate {
  _DuplicateKeyUpdate(this.entry, this.newSortKey);

  final ChecklistEntry entry;
  final UserSortKey newSortKey;
}

ChecklistEntry _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  final id = doc.id;
  final json = doc.data()!;
  final type = json[_Fields.type] as String;
  return switch (type) {
    _itemTypeName => _itemFromFirestore(id, json),
    _headingTypeName => _headingFromFirestore(id, json),
    _ => throw ArgumentError.value(type, _Fields.type, 'Invalid value for checklist entry type')
  };
}

ChecklistEntry _itemFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.item(ChecklistItem(
    id: id,
    name: json[_Fields.name] as String,
    completed: json[_Fields.completed] as bool,
    sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
  ));
}

ChecklistEntry _headingFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.heading(ChecklistHeading(
    id: id,
    name: json[_Fields.name] as String,
    sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
  ));
}

Map<String, dynamic> _itemToFirestore(ChecklistItem item) {
  return {
    _Fields.type: _itemTypeName,
    _Fields.name: item.name,
    _Fields.completed: item.completed,
    _Fields.sortKey: item.sortKey.toJson(),
  };
}

Map<String, dynamic> _headingToFirestore(ChecklistHeading heading) {
  return {
    _Fields.type: _headingTypeName,
    _Fields.name: heading.name,
    _Fields.sortKey: heading.sortKey.toJson(),
  };
}

class _Fields {
  static const type = 'type';
  static const name = 'name';
  static const completed = 'completed';
  static const sortKey = 'sortKey';
}

const String _itemTypeName = 'item';
const String _headingTypeName = 'heading';
