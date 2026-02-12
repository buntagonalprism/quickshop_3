import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utilities/replace_by_id.dart';
import '../../common/application/delay_provider_dispose.dart';
import '../../common/application/firestore_transaction.dart';
import '../../lists/application/list_leave_in_progress_notifier.dart';
import '../../lists/application/lists_notifier.dart';
import '../models/checklist_entry.dart';
import '../repositories/checklist_entry_repo.dart';

part 'checklist_entry_notifier.g.dart';

@riverpod
class ChecklistEntryNotifier extends _$ChecklistEntryNotifier {
  ChecklistEntryRepo get _entryRepo => ref.read(checklistEntryRepoProvider(listId));
  ListsNotifier get _listsNotifier => ref.read(listsProvider.notifier);

  @override
  Stream<List<ChecklistEntry>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    return _entryRepo.entriesStream();
  }

  Future<void> addHeading(String headingName, ChecklistAddPosition position) {
    final tx = ref.read(firestoreTransactionProvider)();
    _entryRepo.addHeading(tx, headingName, position);
    _listsNotifier.updateListModified(tx, listId);
    return tx.commit();
  }

  Future<void> addHeadingAfter(String itemName, ChecklistEntry afterEntry) {
    final tx = ref.read(firestoreTransactionProvider)();
    _entryRepo.addHeadingAfter(tx, itemName, afterEntry);
    _listsNotifier.updateListModified(tx, listId);
    return tx.commit();
  }

  Future<void> addItem(String itemName, ChecklistAddPosition position) {
    final tx = ref.read(firestoreTransactionProvider)();
    _entryRepo.addItem(tx, itemName, position);
    _listsNotifier.incrementListItemCount(tx, listId, 1);
    return tx.commit();
  }

  Future<void> addItemAfter(String itemName, ChecklistEntry afterEntry) {
    final tx = ref.read(firestoreTransactionProvider)();
    _entryRepo.addItemAfter(tx, itemName, afterEntry);
    _listsNotifier.incrementListItemCount(tx, listId, 1);
    return tx.commit();
  }

  Future<void> editHeading(ChecklistHeading heading, String newName) {
    final entries = state.requireValue;
    final updatedHeading = heading.copyWith(name: newName);
    state = AsyncValue.data(replaceById(entries, heading.id, (e) => ChecklistEntry.heading(updatedHeading)));
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.updateListModified(tx, listId);
    _entryRepo.editHeading(tx, heading, newName);
    return tx.commit();
  }

  Future<void> editItem(ChecklistItem item, String newName) {
    final entries = state.requireValue;
    final updatedItem = item.copyWith(name: newName);
    state = AsyncValue.data(replaceById(entries, item.id, (e) => ChecklistEntry.item(updatedItem)));
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.updateListModified(tx, listId);
    _entryRepo.editItem(tx, item, newName);
    return tx.commit();
  }

  Future<void> moveEntry(ChecklistEntry entry, int newIndex) {
    final entries = state.requireValue.toList();
    final currentIndex = entries.indexOf(entry);
    entries.removeAt(currentIndex);
    entries.insert(newIndex, entry);
    state = AsyncValue.data(entries);
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.updateListModified(tx, listId);
    _entryRepo.moveEntry(tx, entry, newIndex);
    return tx.commit();
  }

  Future<void> removeCheckedItems() {
    final entries = state.requireValue;
    final uncheckedEntries = entries.where(
      (e) => e.maybeWhen(
        item: (item) => !item.completed,
        orElse: () => true,
      ),
    );
    state = AsyncValue.data(uncheckedEntries.toList());
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.incrementListItemCount(tx, listId, entries.length - uncheckedEntries.length);
    _entryRepo.removeCheckedItems(tx);
    return tx.commit();
  }

  Future<void> removeHeading(ChecklistHeading heading) {
    final entries = state.requireValue;
    state = AsyncValue.data(entries.where((e) => e.id != heading.id).toList());
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.updateListModified(tx, listId);
    _entryRepo.removeHeading(tx, heading);
    return tx.commit();
  }

  Future<void> removeItem(ChecklistItem item) {
    final entries = state.requireValue;
    state = AsyncValue.data(entries.where((e) => e.id != item.id).toList());
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.incrementListItemCount(tx, listId, -1);
    _entryRepo.removeItem(tx, item);
    return tx.commit();
  }

  Future<void> toggleItem(ChecklistItem item) {
    final entries = state.requireValue;
    final updatedItem = item.copyWith(completed: !item.completed);
    state = AsyncValue.data(
      replaceById(entries, item.id, (e) => ChecklistEntry.item(updatedItem)),
    );
    return _entryRepo.toggleItem(updatedItem);
  }

  Future<void> uncheckAll() {
    final entries = state.requireValue;
    final updatedEntries = entries.map(
      (e) => e.maybeWhen(
        item: (item) => ChecklistEntry.item(item.copyWith(completed: false)),
        orElse: () => e,
      ),
    );
    state = AsyncValue.data(updatedEntries.toList());
    final tx = ref.read(firestoreTransactionProvider)();
    _listsNotifier.updateListModified(tx, listId);
    _entryRepo.uncheckAll(tx);
    return tx.commit();
  }
}
