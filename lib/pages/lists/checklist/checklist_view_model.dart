import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../data/checklists/application/checklist_entry_notifier.dart';
import '../../../data/lists/application/list_provider.dart';
import '../../../data/checklists/models/checklist_entry.dart';
import '../../../data/lists/models/list_summary.dart';

part 'checklist_view_model.freezed.dart';
part 'checklist_view_model.g.dart';

@freezed
abstract class Checklist with _$Checklist {
  const factory Checklist({
    required ListSummary list,
    required List<ChecklistEntry> entries,
  }) = _Checklist;
}

/// The checklist with [listId] and its entries, or null if there is no such checklist.
@riverpod
AsyncValue<Checklist?> checklist(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const AsyncLoading();
  }

  if (listAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(listAsyncValue);
    return AsyncError(listAsyncValue.error!, listAsyncValue.stackTrace!);
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const AsyncData(null);
  }

  if (list.listType != ListType.checklist) {
    ref
        .read(crashReporterProvider)
        .report(
          'checklistProvider was invoked with list id $listId, which is not a checklist',
          StackTrace.current,
        );
    return const AsyncData(null);
  }

  final entriesAsyncValue = ref.watch(checklistEntryProvider(list.id));
  if (entriesAsyncValue.isLoading) {
    return const AsyncLoading();
  }
  if (entriesAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(entriesAsyncValue);
    return AsyncError(entriesAsyncValue.error!, entriesAsyncValue.stackTrace!);
  }
  final entries = entriesAsyncValue.requireValue;
  return AsyncData(Checklist(list: list, entries: entries));
}
