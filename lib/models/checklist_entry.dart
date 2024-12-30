import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_entry.freezed.dart';

@freezed
class ChecklistEntry with _$ChecklistEntry {
  const ChecklistEntry._();

  const factory ChecklistEntry.item({
    required String name,
    required bool completed,
  }) = ChecklistItem;
  const factory ChecklistEntry.header({
    required String name,
    required List<ChecklistItem> items,
  }) = ChecklistHeader;
}
