import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/checklist_entry.dart';
import '../../repositories/checklist_entry_repo.dart';
import '../../repositories/delay_provider_dispose.dart';
import '../../utilities/replace_by_id.dart';
import '../list_leave_in_progress_notifier.dart';

part 'checklist_entry_notifier.g.dart';

@riverpod
class ChecklistEntryNotifier extends _$ChecklistEntryNotifier {
  ChecklistEntryRepo get _repo => ref.read(checklistEntryRepoProvider(listId));

  @override
  Stream<List<ChecklistEntry>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    return _repo.entriesStream();
  }

  Future<void> addHeading(String headingName, ChecklistAddPosition position) {
    return _repo.addHeading(headingName, position);
  }

  Future<void> addHeadingAfter(String itemName, ChecklistEntry afterEntry) {
    return _repo.addHeadingAfter(itemName, afterEntry);
  }

  Future<void> addItem(String itemName, ChecklistAddPosition position) {
    return _repo.addItem(itemName, position);
  }

  Future<void> addItemAfter(String itemName, ChecklistEntry afterEntry) {
    return _repo.addItemAfter(itemName, afterEntry);
  }

  Future<void> editHeading(ChecklistHeading heading, String newName) {
    final entries = state.requireValue;
    final updatedHeading = heading.copyWith(name: newName);
    state = AsyncValue.data(replaceById(entries, heading.id, (e) => ChecklistEntry.heading(updatedHeading)));
    return _repo.editHeading(heading, newName);
  }

  Future<void> editItem(ChecklistItem item, String newName) {
    final entries = state.requireValue;
    final updatedItem = item.copyWith(name: newName);
    state = AsyncValue.data(replaceById(entries, item.id, (e) => ChecklistEntry.item(updatedItem)));
    return _repo.editItem(item, newName);
  }

  Future<void> moveEntry(ChecklistEntry entry, int newIndex) {
    final entries = state.requireValue.toList();
    final currentIndex = entries.indexOf(entry);
    entries.removeAt(currentIndex);
    entries.insert(newIndex, entry);
    state = AsyncValue.data(entries);
    return _repo.moveEntry(entry, newIndex);
  }

  Future<void> removeCheckedItems() {
    final entries = state.requireValue;
    final uncheckedEntries = entries.where((e) => e.maybeWhen(
          item: (item) => !item.completed,
          orElse: () => true,
        ));
    state = AsyncValue.data(uncheckedEntries.toList());
    return _repo.removeCheckedItems();
  }

  Future<void> removeHeading(ChecklistHeading heading) {
    final entries = state.requireValue;
    state = AsyncValue.data(entries.where((e) => e.id != heading.id).toList());
    return _repo.removeHeading(heading);
  }

  Future<void> removeItem(ChecklistItem item) {
    final entries = state.requireValue;
    state = AsyncValue.data(entries.where((e) => e.id != item.id).toList());
    return _repo.removeItem(item);
  }

  Future<void> toggleItem(ChecklistItem item) {
    final entries = state.requireValue;
    final updatedItem = item.copyWith(completed: !item.completed);
    state = AsyncValue.data(
      replaceById(entries, item.id, (e) => ChecklistEntry.item(updatedItem)),
    );
    return _repo.toggleItem(updatedItem);
  }

  Future<void> uncheckAll() {
    final entries = state.requireValue;
    final updatedEntries = entries.map((e) => e.maybeWhen(
          item: (item) => ChecklistEntry.item(item.copyWith(completed: false)),
          orElse: () => e,
        ));
    state = AsyncValue.data(updatedEntries.toList());
    return _repo.uncheckAll();
  }
}
