import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_leave_in_progress_repo.g.dart';

typedef ListId = String;

/// A repository that stores the list IDs of lists that are in progress of being left. This allows
/// other repositories to unsubscribe from Firestore before the list is actually left, avoiding
/// the permission-denied error that would otherwise occur once the user no longer has permission
/// to read the list.
@riverpod
class ListLeaveInProgressRepo extends _$ListLeaveInProgressRepo {
  @override
  Set<ListId> build() {
    return {};
  }

  void add(String listId) {
    state = {...state, listId};
  }

  void remove(String listId) {
    state = {...state}..remove(listId);
  }
}
