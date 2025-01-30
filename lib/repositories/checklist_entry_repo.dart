import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
    final newItem = ChecklistItem(
      id: '',
      name: itemName,
      completed: false,
      sortKey: _getSortKeyForInsertIndex(entries, index),
    );

    final itemDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(itemDoc, _itemToFirestore(newItem));
    batch.update(listDoc, {
      ListSummary.fields.itemCount: FieldValue.increment(1),
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
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
    final newHeading = ChecklistHeading(
      id: '',
      name: headingName,
      sortKey: _getSortKeyForInsertIndex(entries, index),
    );
    final headingDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(headingDoc, _headingToFirestore(newHeading));
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
  }

  Future<void> toggleItem(ChecklistItem item) {
    final fs = ref.read(firestoreProvider);
    return fs.doc('lists/$listId/items/${item.id}').update({
      _Fields.completed: !item.completed,
    });
  }

  Future<void> removeItem(ChecklistItem item) {
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
    return batch.commit();
  }

  Future<void> removeHeading(ChecklistHeading heading) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final headingDoc = fs.doc('lists/$listId/items/${heading.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.delete(headingDoc);
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }

  Future<void> moveEntry(ChecklistEntry entry, int newIndex) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    // Remove the item from its current position and get the sort key to insert it at the new index
    final entries = state.requireValue.toList();
    final currentIndex = entries.indexOf(entry);
    entries.removeAt(currentIndex);
    final newSortKey = _getSortKeyForInsertIndex(entries, newIndex);

    // Make the change immediately in memory
    entries.insert(newIndex, entry);
    state = AsyncValue.data(entries);

    final entryId = entry.when(item: (item) => item.id, heading: (heading) => heading.id);
    final entryDoc = fs.doc('lists/$listId/items/$entryId');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(entryDoc, {
      _Fields.sortKey: newSortKey.toJson(),
    });
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }

  UserSortKey _getSortKeyForInsertIndex(List<ChecklistEntry> entries, int newIndex) {
    if (entries.isEmpty) {
      return const UserSortKey(
        primary: 0,
        secondary: '',
      );
    }
    if (newIndex <= 0) {
      return UserSortKey(
        primary: entries[0].sortKey.primary - 1,
        secondary: '',
      );
    }
    if (newIndex >= entries.length) {
      return UserSortKey(
        primary: entries[entries.length - 1].sortKey.primary + 1,
        secondary: '',
      );
    }
    return UserSortKey.between(
      entries[newIndex - 1].sortKey,
      entries[newIndex].sortKey,
    );
  }

  Future<void> editItem(ChecklistItem item, String newName) {
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
    return batch.commit();
  }

  Future<void> editHeading(ChecklistHeading heading, String newName) {
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
    return batch.commit();
  }

  Future<void> uncheckAll() {
    if (!state.hasValue) {
      throw StateError('Cannot uncheck items from a list that has not been loaded');
    }
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final batch = fs.batch();
    for (var entry in state.requireValue) {
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
    return batch.commit();
  }
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
