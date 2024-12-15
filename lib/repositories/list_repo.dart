import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/list_summary.dart';
import '../services/firestore.dart';
import '../services/functions_http_client.dart';
import '../services/http_result.dart';
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
        .where(ListSummary.fieldKeys.editorIds, arrayContains: user.id)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map(ListSummary.fromFirestore).toList();
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
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingListCreated());
    return listDoc.id;
  }

  Future<void> updateListName(String listId, String name) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    await fs.collection('lists').doc(listId).update({
      ListSummary.fieldKeys.name: name,
      '${ListSummary.fieldKeys.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingListRenamed());
  }

  Future<AcceptInviteResult> acceptListInvite(String inviteId) async {
    final client = ref.read(functionsHttpClientProvider);
    final result = await client.post('/acceptListInvite', {'inviteId': inviteId});
    final status = switch (result.resultStatus) {
      HttpResultStatus.success => AcceptInviteResult.success,
      HttpResultStatus.retryableError ||
      HttpResultStatus.connectionError =>
        AcceptInviteResult.retryableError,
      HttpResultStatus.unknownError => AcceptInviteResult.unknownError,
    };
    if (status == AcceptInviteResult.success) {
      ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingListInviteAccepted());
    }
    return status;
  }

  Future<void> deleteList(String listId) async {
    final fs = ref.read(firestoreProvider);
    await fs.collection('lists').doc(listId).delete();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingListDeleted());
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
