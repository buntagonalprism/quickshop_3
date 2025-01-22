import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_sortable.dart';

part 'checklist_entry.freezed.dart';

@freezed
class ChecklistEntry with _$ChecklistEntry implements UserSortable {
  const ChecklistEntry._();

  const factory ChecklistEntry.item(ChecklistItem item) = _ChecklistEntryItem;
  const factory ChecklistEntry.group(ChecklistGroup group) = _ChecklistEntryHeader;

  @override
  UserSortKey get sortKey {
    return when(
      item: (item) => item.sortKey,
      group: (group) => group.sortKey,
    );
  }

  @override
  String get sortFallback {
    return when(
      item: (item) => item.sortFallback,
      group: (group) => group.sortFallback,
    );
  }

  Map<String, dynamic> toFirestore() {
    return when(
      item: (item) => item.toFirestore(),
      group: (group) => group.toFirestore(),
    );
  }

  factory ChecklistEntry.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final id = doc.id;
    final json = doc.data()!;
    final type = json['type'] as String;
    switch (type) {
      case 'item':
        return ChecklistEntry.item(ChecklistItem.fromJson(id, json));
      case 'group':
        return ChecklistEntry.group(ChecklistGroup.fromJson(id, json));
      default:
        throw ArgumentError.value(type, 'type', 'Invalid value for checklist entry type');
    }
  }
}

@freezed
class ChecklistItem with _$ChecklistItem implements UserSortable {
  const ChecklistItem._();

  const factory ChecklistItem({
    required String id,
    required String name,
    required bool completed,
    required UserSortKey sortKey,
    String? groupId,
  }) = _ChecklistItem;

  @override
  String get sortFallback => name;

  Map<String, dynamic> toFirestore() {
    return {
      'type': 'item',
      'name': name,
      'completed': completed,
      'sortKey': sortKey.toJson(),
      if (groupId != null) 'groupId': groupId,
    };
  }

  factory ChecklistItem.fromJson(String id, Map<String, dynamic> json) {
    return ChecklistItem(
      id: id,
      name: json['name'] as String,
      completed: json['completed'] as bool,
      sortKey: UserSortKey.fromJson(json['sortKey'] as Map<String, dynamic>),
      groupId: json['groupId'] as String?,
    );
  }
}

@freezed
class ChecklistGroup with _$ChecklistGroup implements UserSortable {
  const ChecklistGroup._();

  const factory ChecklistGroup({
    required String id,
    required String name,
    required UserSortKey sortKey,
  }) = _ChecklistGroup;

  @override
  String get sortFallback => name;

  Map<String, dynamic> toFirestore() {
    return {
      'type': 'group',
      'name': name,
      'sortKey': sortKey.toJson(),
    };
  }

  factory ChecklistGroup.fromJson(String id, Map<String, dynamic> json) {
    return ChecklistGroup(
      id: id,
      name: json['name'] as String,
      sortKey: UserSortKey.fromJson(json['sortKey'] as Map<String, dynamic>),
    );
  }
}
