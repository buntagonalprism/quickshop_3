import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../models/list_summary.dart';
import '../../../repositories/checklist_entry_repo.dart';
import '../../../repositories/list_repo.dart';

part 'checklist_view_model.freezed.dart';
part 'checklist_view_model.g.dart';

@freezed
class ChecklistViewModel with _$ChecklistViewModel {
  const ChecklistViewModel._();

  const factory ChecklistViewModel.error() = _Error;
  const factory ChecklistViewModel.loading() = _Loading;
  const factory ChecklistViewModel.notFound() = _NotFound;
  const factory ChecklistViewModel.success({
    required ListSummary list,
    required List<ChecklistPageEntry> entries,
  }) = _Checklist;
}

@freezed
class ChecklistPageEntry with _$ChecklistPageEntry {
  const factory ChecklistPageEntry.ungroupedItem({
    required String name,
    required bool completed,
  }) = _Item;
  const factory ChecklistPageEntry.header({
    required String name,
  }) = _Header;
  const factory ChecklistPageEntry.groupedItem({
    required String name,
    required bool completed,
    required bool lastInGroup,
  }) = _GroupedItem;
}

@riverpod
ChecklistViewModel checklistViewModel(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const ChecklistViewModel.loading();
  }

  if (listAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(listAsyncValue);
    return const ChecklistViewModel.error();
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const ChecklistViewModel.notFound();
  }

  if (list.listType != ListType.checklist) {
    ref.read(crashReporterProvider).report(
          'ChecklistViewModel was invoked with list id $listId, which is not a checklist',
          StackTrace.current,
        );
    return const ChecklistViewModel.notFound();
  }

  final entriesAsyncValue = ref.watch(checklistEntryRepoProvider(list.id));
  if (entriesAsyncValue.isLoading) {
    return const ChecklistViewModel.loading();
  }
  if (entriesAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(entriesAsyncValue);
    return const ChecklistViewModel.error();
  }
  final entries = entriesAsyncValue.requireValue;
  final pageEntries = <ChecklistPageEntry>[];
  for (final entry in entries) {
    entry.when(
      item: (item) {
        pageEntries.add(ChecklistPageEntry.ungroupedItem(
          name: item.name,
          completed: item.completed,
        ));
      },
      group: (group) {
        pageEntries.add(ChecklistPageEntry.header(
          name: group.name,
        ));
      },
    );
  }
  return ChecklistViewModel.success(
    list: list,
    entries: pageEntries,
  );
}
