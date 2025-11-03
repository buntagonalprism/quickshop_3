import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../repositories/list_repo.dart';
import '../repositories/user_repo.dart';
import '../services/http_result.dart';

part 'list_store.g.dart';

@Riverpod(keepAlive: true)
class ListStore extends _$ListStore {
  @override
  Stream<List<ListSummary>> build() {
    final repo = ref.watch(listRepoProvider);
    final user = ref.watch(userRepoProvider);
    if (user == null) {
      return const Stream.empty();
    }
    return repo.getAllLists();
  }

  Future<String> createList(String name, ListType listType) async {
    return ref.read(listRepoProvider).createList(name, listType);
  }

  Future<void> updateListName(ListSummary list, String name) {
    final repo = ref.read(listRepoProvider);
    final listIdx = state.value?.indexWhere((l) => l.id == list.id);
    if (listIdx != null && listIdx >= 0) {
      final currentList = state.value![listIdx];
      final updatedList = currentList.copyWith(name: name);
      state = AsyncValue.data([
        updatedList,
        ...state.value!.where((l) => l.id != list.id),
      ]);
    }
    return repo.updateListName(list, name);
  }

  Future<HttpResult> acceptListInvite(ListInvite invite) async {
    return ref.read(listRepoProvider).acceptListInvite(invite);
  }

  Future<HttpResult> leaveList(ListSummary list) async {
    return ref.read(listRepoProvider).leaveList(list);
  }

  Future<void> deleteList(ListSummary list) async {
    final currentLists = state.value;
    if (currentLists != null) {
      state = AsyncValue.data(
        currentLists.where((l) => l.id != list.id).toList(),
      );
    }
    return ref.read(listRepoProvider).deleteList(list);
  }
}
