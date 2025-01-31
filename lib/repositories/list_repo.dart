import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../services/firestore.dart';
import '../services/functions_http_client.dart';
import '../services/http_result.dart';
import 'list_leave_in_progress_repo.dart';
import 'user_repo.dart';

part 'list_repo.g.dart';

@Riverpod(keepAlive: true)
class ListRepo extends _$ListRepo {
  @override
  Stream<List<ListSummary>> build() {
    final fs = ref.watch(firestoreProvider);
    final user = ref.watch(userRepoProvider);
    if (user == null) {
      return const Stream.empty();
    }
    return fs
        .collection('lists')
        .where(ListSummary.fields.editorIds, arrayContains: user.id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(ListSummary.fromFirestore).toList()
        ..sort((a, b) => (b.lastModified[user.id] ?? 0).compareTo(a.lastModified[user.id] ?? 0));
    });
  }

  /// Creates a new list and returns the list id
  Future<String> createList(String name, ListType listType) async {
    final user = ref.watch(userRepoProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = ref.read(firestoreProvider);
    final list = ListSummary(
      id: '',
      name: name,
      ownerId: user.id,
      editorIds: [user.id],
      editors: [user],
      itemCount: 0,
      lastModified: {user.id: DateTime.now().millisecondsSinceEpoch},
      listType: listType,
    );
    final listDoc = await fs.collection('lists').add(list.toFirestore());
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listCreated(listType));
    return listDoc.id;
  }

  Future<void> updateListName(ListSummary list, String name) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    await fs.collection('lists').doc(list.id).update({
      ListSummary.fields.name: name,
      '${ListSummary.fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listRenamed(list.listType));
  }

  Future<HttpResult> acceptListInvite(ListInvite invite) async {
    final client = ref.read(functionsHttpClientProvider);
    final result = await client.post('/acceptListInvite', {'inviteId': invite.id});
    if (result is HttpResultSuccess) {
      ref.read(analyticsProvider).logEvent(AnalyticsEvent.listInviteAccepted(invite.listType));
    }
    return result;
  }

  Future<HttpResult> leaveList(ListSummary list) async {
    final client = ref.read(functionsHttpClientProvider);
    ref.read(listLeaveInProgressRepoProvider.notifier).add(list.id);
    final result = await client.post('/leaveList', {'listId': list.id});
    if (result is HttpResultSuccess) {
      ref.read(analyticsProvider).logEvent(AnalyticsEvent.listLeft(list.listType));
    } else {
      ref.read(listLeaveInProgressRepoProvider.notifier).remove(list.id);
    }
    return result;
  }

  Future<void> deleteList(ListSummary list) async {
    final fs = ref.read(firestoreProvider);
    await fs.collection('lists').doc(list.id).delete();
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listDeleted(list.listType));
  }
}

@riverpod
AsyncValue<ListSummary?> list(Ref ref, String listId) {
  final result = ref.watch(listRepoProvider);
  return result.when(
    data: (lists) => AsyncValue.data(
      lists.any((list) => list.id == listId) ? lists.firstWhere((list) => list.id == listId) : null,
    ),
    error: (error, trace) => AsyncValue.error(error, trace),
    loading: AsyncValue.loading,
  );
}

enum AcceptInviteResult {
  success,
  retryableError,
  unknownError,
}
