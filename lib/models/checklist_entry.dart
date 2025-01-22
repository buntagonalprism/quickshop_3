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
}

@freezed
class ChecklistGroup with _$ChecklistGroup implements UserSortable {
  const ChecklistGroup._();

  const factory ChecklistGroup({
    required String id,
    required String name,
    required UserSortKey sortKey,
    required List<ChecklistItem> items,
  }) = _ChecklistGroup;

  @override
  String get sortFallback => name;
}
