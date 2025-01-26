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
      return _mergeAndSort(entries);
    });
  }

  Future<void> addItem(String itemName, ChecklistAddPosition position) async {
    if (!state.hasValue) {
      throw StateError('Cannot add item to a list that has not been loaded');
    }
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    final entries = state.requireValue;
    final newItem = ChecklistItem(
      id: '',
      name: itemName,
      completed: false,
      groupId: null,
      sortKey: UserSortKey(
        primary: _getPrimarySortIdx(entries, position),
        secondary: '',
      ),
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

  Future<void> addGroup(String groupName, ChecklistAddPosition position) async {
    if (!state.hasValue) {
      throw StateError('Cannot add group to a list that has not been loaded');
    }
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    final entries = state.requireValue;
    final newGroup = ChecklistGroup(
      id: '',
      name: groupName,
      items: [],
      sortKey: UserSortKey(
        primary: _getPrimarySortIdx(entries, position),
        secondary: '',
      ),
    );
    final groupDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(groupDoc, _groupToFirestore(newGroup));
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
  }

  int _getPrimarySortIdx(List<UserSortable> items, ChecklistAddPosition position) {
    if (items.isEmpty) {
      return 0;
    }
    return switch (position) {
      ChecklistAddPosition.start => items.first.sortKey.primary - 1,
      ChecklistAddPosition.end => items.last.sortKey.primary + 1
    };
  }

  Future<void> toggleItem(ChecklistItem item) {
    final fs = ref.read(firestoreProvider);
    return fs.doc('lists/$listId/items/${item.id}').update({
      _Fields.completed: !item.completed,
    });
  }

  Future<void> editItem(ChecklistItem item, String newName) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final itemDoc = fs.doc('lists/$listId/items/${item.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(itemDoc, {
      _Fields.name: newName,
    });
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }

  Future<void> editGroup(ChecklistGroup group, String newName) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final groupDoc = fs.doc('lists/$listId/items/${group.id}');
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.update(groupDoc, {
      _Fields.name: newName,
    });
    batch.update(listDoc, {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }

  Future<void> addItemToGroup(
      ChecklistGroup group, String itemName, ChecklistAddPosition position) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);

    final newItem = ChecklistItem(
      id: '',
      name: itemName,
      completed: false,
      groupId: group.id,
      sortKey: UserSortKey(
        primary: _getPrimarySortIdx(group.items, position),
        secondary: '',
      ),
    );
    final itemDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(itemDoc, _itemToFirestore(newItem));
    batch.update(listDoc, {
      ListSummary.fields.itemCount: FieldValue.increment(1),
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }

  Future<void> uncheckAll() {
    if (!state.hasValue) {
      throw StateError('Cannot add group to a list that has not been loaded');
    }
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final batch = fs.batch();
    for (var entry in state.requireValue) {
      entry.when(
        item: (item) {
          if (item.completed) {
            batch.update(fs.doc('lists/$listId/items/${item.id}'), {
              _Fields.completed: false,
            });
          }
        },
        group: (group) {
          for (var item in group.items) {
            if (item.completed) {
              batch.update(fs.doc('lists/$listId/items/${item.id}'), {
                _Fields.completed: false,
              });
            }
          }
        },
      );
    }
    batch.update(fs.doc('lists/$listId'), {
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    return batch.commit();
  }
}

List<ChecklistEntry> _mergeAndSort(Iterable<ChecklistEntry> entries) {
  final ungroupedItems = <ChecklistItem>[];
  final groupedItems = <String, List<ChecklistItem>>{};
  final groups = <ChecklistGroup>[];
  for (var entry in entries) {
    entry.when(
      item: (item) {
        final groupId = item.groupId;
        if (groupId == null) {
          ungroupedItems.add(item);
        } else {
          groupedItems.putIfAbsent(groupId, () => []).add(item);
        }
      },
      group: (group) {
        groups.add(group);
      },
    );
  }
  final groupsWithItems = <ChecklistGroup>[];
  for (var group in groups) {
    final groupItems = groupedItems[group.id] ?? [];
    groupItems.userSort();
    groupsWithItems.add(group.copyWith(items: groupItems));
  }
  final allTopLevelEntries = [
    ...ungroupedItems.map((i) => ChecklistEntry.item(i)),
    ...groupsWithItems.map((g) => ChecklistEntry.group(g)),
  ];
  allTopLevelEntries.userSort();
  return allTopLevelEntries;
}

ChecklistEntry _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  final id = doc.id;
  final json = doc.data()!;
  final type = json[_Fields.type] as String;
  return switch (type) {
    _itemTypeName => _itemFromFirestore(id, json),
    _groupTypeName => _groupFromFirestore(id, json),
    _ => throw ArgumentError.value(type, _Fields.type, 'Invalid value for checklist entry type')
  };
}

ChecklistEntry _itemFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.item(ChecklistItem(
    id: id,
    name: json[_Fields.name] as String,
    completed: json[_Fields.completed] as bool,
    sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
    groupId: json[_Fields.groupId] as String?,
  ));
}

ChecklistEntry _groupFromFirestore(String id, Map<String, dynamic> json) {
  return ChecklistEntry.group(ChecklistGroup(
    id: id,
    name: json[_Fields.name] as String,
    sortKey: UserSortKey.fromJson(json[_Fields.sortKey] as Map<String, dynamic>),
    items: [],
  ));
}

Map<String, dynamic> _itemToFirestore(ChecklistItem item) {
  return {
    _Fields.type: _itemTypeName,
    _Fields.name: item.name,
    _Fields.completed: item.completed,
    _Fields.groupId: item.groupId,
    _Fields.sortKey: item.sortKey.toJson(),
  };
}

Map<String, dynamic> _groupToFirestore(ChecklistGroup group) {
  return {
    _Fields.type: _groupTypeName,
    _Fields.name: group.name,
    _Fields.sortKey: group.sortKey.toJson(),
  };
}

class _Fields {
  static const type = 'type';
  static const name = 'name';
  static const completed = 'completed';
  static const groupId = 'groupId';
  static const sortKey = 'sortKey';
}

const String _itemTypeName = 'item';
const String _groupTypeName = 'group';
