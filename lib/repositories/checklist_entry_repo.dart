import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/checklist_entry.dart';
import '../models/user_sortable.dart';
import '../services/firestore.dart';
import 'list_items_transaction.dart';

part 'checklist_entry_repo.g.dart';

/// When adding items to a checklist, they may either be added to the start or end of the list.
enum ChecklistAddPosition {
  start,
  end,
}

@Riverpod(keepAlive: true)
ChecklistEntryRepo checklistEntryRepo(Ref ref, String listId) {
  return ChecklistEntryRepo(ref, listId);
}

class ChecklistEntryRepo {
  final Ref ref;
  final String listId;

  ChecklistEntryRepo(this.ref, this.listId);

  final _listEntries = <String, List<ChecklistEntry>>{};

  Stream<List<ChecklistEntry>> entriesStream() {
    final fs = ref.watch(firestoreProvider);
    final stream = fs.collection('lists/$listId/items').snapshots();
    return stream.map((snapshot) {
      final entries = snapshot.docs.map(_fromFirestore);
      _listEntries[listId] = entries.toList()..userSort();
      return _listEntries[listId]!;
    });
  }

  void addItem(ListItemsTransaction tx, String itemName, ChecklistAddPosition position) {
    return switch (position) {
      ChecklistAddPosition.start => _addItemAtIndex(tx, itemName, 0),
      ChecklistAddPosition.end => _addItemAtIndex(tx, itemName, _listEntries[listId]!.length),
    };
  }

  void addItemAfter(ListItemsTransaction tx, String itemName, ChecklistEntry afterEntry) {
    final entries = _listEntries[listId]!;
    final index = entries.indexOf(afterEntry);
    _addItemAtIndex(tx, itemName, index + 1);
  }

  void _addItemAtIndex(ListItemsTransaction tx, String itemName, int index) {
    final fs = ref.read(firestoreProvider);

    final entries = _listEntries[listId]!;
    final insertUpdates = _KeyInsertUpdates(entries, index);

    final newItem = ChecklistItem(
      id: '',
      name: itemName,
      completed: false,
      sortKey: insertUpdates.insertKey,
    );

    final itemDoc = fs.collection('lists/$listId/items').doc();
    tx.batch.set(itemDoc, _itemToFirestore(newItem));
    _makeDuplicateUpdates(fs, tx.batch, insertUpdates);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemCreated());
    _logIfDuplicateKeysFound(insertUpdates);
  }

  void addHeading(ListItemsTransaction tx, String headingName, ChecklistAddPosition position) {
    return switch (position) {
      ChecklistAddPosition.start => _addHeadingAtIndex(tx, headingName, 0),
      ChecklistAddPosition.end => _addHeadingAtIndex(tx, headingName, _listEntries[listId]!.length),
    };
  }

  void addHeadingAfter(ListItemsTransaction tx, String headingName, ChecklistEntry afterEntry) {
    final entries = _listEntries[listId]!;
    final index = entries.indexOf(afterEntry);
    _addHeadingAtIndex(tx, headingName, index + 1);
  }

  void _addHeadingAtIndex(ListItemsTransaction tx, String headingName, int index) {
    final fs = ref.read(firestoreProvider);

    final entries = _listEntries[listId]!;
    final insertUpdates = _KeyInsertUpdates(entries, index);

    final newHeading = ChecklistHeading(
      id: '',
      name: headingName,
      sortKey: insertUpdates.insertKey,
    );
    final headingDoc = fs.collection('lists/$listId/items').doc();
    tx.batch.set(headingDoc, _headingToFirestore(newHeading));
    _makeDuplicateUpdates(fs, tx.batch, insertUpdates);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingCreated());
    _logIfDuplicateKeysFound(insertUpdates);
  }

  Future<void> toggleItem(ChecklistItem item) {
    final fs = ref.read(firestoreProvider);
    return fs.doc('lists/$listId/items/${item.id}').update({
      _Fields.completed: !item.completed,
    });
  }

  void removeItem(ListItemsTransaction tx, ChecklistItem item) {
    final fs = ref.read(firestoreProvider);
    final itemDoc = fs.doc('lists/$listId/items/${item.id}');
    tx.batch.delete(itemDoc);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemDeleted());
  }

  void removeHeading(ListItemsTransaction tx, ChecklistHeading heading) {
    final fs = ref.read(firestoreProvider);
    final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
    tx.batch.delete(headingDoc);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingDeleted());
  }

  void moveEntry(ListItemsTransaction tx, ChecklistEntry entry, int newIndex) {
    final fs = ref.read(firestoreProvider);

    final entries = _listEntries[listId]!.toList();
    final currentIndex = entries.indexOf(entry);
    entries.removeAt(currentIndex);
    final insertUpdates = _KeyInsertUpdates(entries, newIndex);

    final entryDoc = fs.doc('lists/$listId/items/${entry.id}');
    tx.batch.update(entryDoc, {
      _Fields.sortKey: insertUpdates.insertKey.toJson(),
    });
    _makeDuplicateUpdates(fs, tx.batch, insertUpdates);
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

  void editItem(ListItemsTransaction tx, ChecklistItem item, String newName) {
    final fs = ref.read(firestoreProvider);
    final itemDoc = fs.doc('lists/$listId/items/${item.id}');
    tx.batch.update(itemDoc, {
      _Fields.name: newName.trim(),
    });
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemUpdated());
  }

  void editHeading(ListItemsTransaction tx, ChecklistHeading heading, String newName) {
    final fs = ref.read(firestoreProvider);
    final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
    tx.batch.update(headingDoc, {
      _Fields.name: newName.trim(),
    });
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistHeadingUpdated());
  }

  void uncheckAll(ListItemsTransaction tx) {
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    final entries = _listEntries[listId]!;
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
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemsBatchUnchecked());
  }

  void removeCheckedItems(ListItemsTransaction tx) async {
    final fs = ref.read(firestoreProvider);
    final entries = _listEntries[listId]!;
    int itemsRemoved = 0;
    entries.forEachIndexed((index, entry) {
      entry.when(
        item: (item) {
          if (item.completed) {
            final itemDoc = fs.doc('lists/$listId/items/${item.id}');
            tx.batch.delete(itemDoc);
            itemsRemoved++;
          }
        },
        heading: (heading) {
          final hasUncompletedItem = _headingHasUncompletedItem(entries, heading);
          if (!hasUncompletedItem) {
            final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
            tx.batch.delete(headingDoc);
          }
        },
      );
    });
    if (itemsRemoved > 0) {
      ref.read(analyticsProvider).logEvent(const AnalyticsEvent.checklistItemsBatchDeleted());
    }
  }

  /// Checks to see if there is an uncomplete item below the given heading, before the next heading
  /// or the end of the list.
  bool _headingHasUncompletedItem(List<ChecklistEntry> entries, ChecklistHeading heading) {
    final headingIndex = entries.indexOf(heading.asEntry);
    for (var i = headingIndex + 1; i < entries.length; i++) {
      final entry = entries[i];
      final isUncompletedItem = entry.maybeWhen(item: (item) => !item.completed, orElse: () => false);
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
  _KeyInsertUpdates(List<ChecklistEntry> entries, int insertIndex) : _entries = entries, _insertIndex = insertIndex {
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
    _ => throw ArgumentError.value(type, _Fields.type, 'Invalid value for checklist entry type'),
  };
}

ChecklistEntry _itemFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.item(
    ChecklistItem(
      id: id,
      name: json[_Fields.name] as String,
      completed: json[_Fields.completed] as bool,
      sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
    ),
  );
}

ChecklistEntry _headingFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.heading(
    ChecklistHeading(
      id: id,
      name: json[_Fields.name] as String,
      sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
    ),
  );
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
