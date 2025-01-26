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
    final newGroup = ChecklistHeading(
      id: '',
      name: groupName,
      sortKey: UserSortKey(
        primary: _getPrimarySortIdx(entries, position),
        secondary: '',
      ),
    );
    final groupDoc = fs.collection('lists/$listId/items').doc();
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.set(groupDoc, _headingToFirestore(newGroup));
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

  Future<void> editGroup(ChecklistHeading group, String newName) {
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

  Future<void> uncheckAll() {
    if (!state.hasValue) {
      throw StateError('Cannot add group to a list that has not been loaded');
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
    _groupTypeName => _headingFromFirestore(id, json),
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
    _Fields.type: _groupTypeName,
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
const String _groupTypeName = 'group';
