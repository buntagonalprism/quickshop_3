import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../models/user/user.dart';
import '../services/firestore.dart';
import '../services/functions_http_client.dart';
import '../services/http_result.dart';
import 'list_leave_in_progress_repo.dart';
import 'user_repo.dart';

part 'list_repo.g.dart';

@Riverpod(keepAlive: true)
ListRepo listRepo(Ref ref) {
  return ListRepo(ref);
}

class ListRepo {
  final Ref ref;
  ListRepo(this.ref);

  Stream<List<ListSummary>> getAllLists() {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    return fs.collection('lists').where(_Fields.editorIds, arrayContains: user.id).snapshots().map(
      (snapshot) {
        return snapshot.docs.map(_fromFirestore).toList()
          ..sort((a, b) => (b.lastModified[user.id] ?? 0).compareTo(a.lastModified[user.id] ?? 0));
      },
    );
  }

  /// Creates a new list and returns the list id
  Future<String> createList(String name, ListType listType) async {
    final user = ref.read(userRepoProvider);
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
    final listDoc = await fs.collection('lists').add(_toFirestore(list));
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listCreated(listType));
    return listDoc.id;
  }

  Future<void> updateListName(ListSummary list, String name) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    await fs.collection('lists').doc(list.id).update({
      _Fields.name: name,
      '${_Fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
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

enum AcceptInviteResult {
  success,
  retryableError,
  unknownError,
}

void updateListModified(Ref ref, WriteBatch batch, String listId) {
  final user = ref.watch(userRepoProvider);
  final fs = ref.read(firestoreProvider);
  final listDoc = fs.doc('lists/$listId');
  batch.update(listDoc, {
    '${_Fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
  });
}

void incrementListItemCount(Ref ref, WriteBatch batch, String listId, int delta) {
  final user = ref.watch(userRepoProvider);
  final fs = ref.read(firestoreProvider);
  final listDoc = fs.doc('lists/$listId');
  batch.update(listDoc, {
    '${_Fields.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    _Fields.itemCount: FieldValue.increment(delta),
  });
}

ListSummary _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  return _fromJson(doc.data()!, doc.id);
}

ListSummary _fromJson(Map<String, dynamic> json, String listId) {
  return ListSummary(
    id: listId,
    name: json[_Fields.name],
    ownerId: json['ownerId'],
    editorIds: List<String>.from(json[_Fields.editorIds]),
    editors: List<User>.from(List<Map<String, dynamic>>.from(json['editors']).map(User.fromJson)),
    itemCount: json[_Fields.itemCount],
    lastModified: Map<String, int>.from(json[_Fields.lastModified]),
    listType: parseListType(json['listType']),
  );
}

Map<String, dynamic> _toFirestore(ListSummary list) {
  return {
    _Fields.name: list.name,
    'ownerId': list.ownerId,
    _Fields.editorIds: list.editorIds,
    'editors': list.editors
        .map((e) => {
              'id': e.id,
              'name': e.name,
              'email': e.email,
            })
        .toList(),
    _Fields.itemCount: list.itemCount,
    _Fields.lastModified: list.lastModified,
    'listType': list.listType.name,
  };
}

class _Fields {
  static const String name = 'name';
  static const String editorIds = 'editorIds';
  static const String itemCount = 'itemCount';
  static const String lastModified = 'lastModified';
}
