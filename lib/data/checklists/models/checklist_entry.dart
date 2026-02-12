import 'package:freezed_annotation/freezed_annotation.dart';

import '../../has_id.dart';
import '../../user_sortable.dart';

part 'checklist_entry.freezed.dart';

@freezed
sealed class ChecklistEntry with _$ChecklistEntry implements UserSortable, HasId {
  const ChecklistEntry._();

  const factory ChecklistEntry.item(ChecklistItem item) = _ChecklistEntryItem;
  const factory ChecklistEntry.heading(ChecklistHeading heading) = _ChecklistEntryHeading;

  @override
  UserSortKey get sortKey {
    return when(
      item: (item) => item.sortKey,
      heading: (heading) => heading.sortKey,
    );
  }

  @override
  String get sortFallback {
    return when(
      item: (item) => item.sortFallback,
      heading: (heading) => heading.sortFallback,
    );
  }

  @override
  String get id {
    return when(
      item: (item) => item.id,
      heading: (heading) => heading.id,
    );
  }
}

@freezed
abstract class ChecklistItem with _$ChecklistItem implements UserSortable {
  const ChecklistItem._();

  const factory ChecklistItem({
    required String id,
    required String name,
    required bool completed,
    required UserSortKey sortKey,
  }) = _ChecklistItem;

  @override
  String get sortFallback => name;

  ChecklistEntry get asEntry => ChecklistEntry.item(this);
}

@freezed
abstract class ChecklistHeading with _$ChecklistHeading implements UserSortable {
  const ChecklistHeading._();

  const factory ChecklistHeading({
    required String id,
    required String name,
    required UserSortKey sortKey,
  }) = _ChecklistHeading;

  @override
  String get sortFallback => name;

  ChecklistEntry get asEntry => ChecklistEntry.heading(this);
}
