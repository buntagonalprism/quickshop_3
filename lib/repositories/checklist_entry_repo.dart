import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/checklist_entry.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'list_leave_in_progress_repo.dart';

part 'checklist_entry_repo.g.dart';

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
      return snapshot.docs.map(ChecklistEntry.fromFirestore).toList();
    });
  }
}
