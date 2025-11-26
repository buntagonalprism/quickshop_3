import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../application/list_leave_in_progress_notifier.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../models/user/user_auth.dart';
import '../services/auth_service.dart';
import '../services/firestore.dart';
import '../services/functions_http_client.dart';
import '../services/http_result.dart';
import 'list_items_transaction.dart';

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
    final user = ref.read(userAuthProvider);
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
    final user = ref.read(userAuthProvider);
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
    final user = ref.read(userAuthProvider);
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
    ref.read(listLeaveInProgressProvider.notifier).add(list.id);
    final result = await client.post('/leaveList', {'listId': list.id});
    if (result is HttpResultSuccess) {
      ref.read(analyticsProvider).logEvent(AnalyticsEvent.listLeft(list.listType));
    } else {
      ref.read(listLeaveInProgressProvider.notifier).remove(list.id);
    }
    return result;
  }

  Future<void> deleteList(ListSummary list) async {
    final fs = ref.read(firestoreProvider);
    await fs.collection('lists').doc(list.id).delete();
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listDeleted(list.listType));
  }

  void updateListModified(ListItemsTransaction tx, String listId, DateTime modifiedAt) {
    final user = ref.read(userAuthProvider);
    final fs = ref.read(firestoreProvider);
    final listDoc = fs.doc('lists/$listId');
    tx.batch.update(listDoc, {
      '${_Fields.lastModified}.${user!.id}': modifiedAt.millisecondsSinceEpoch,
    });
  }

  void incrementListItemCount(ListItemsTransaction tx, String listId, int delta, DateTime modifiedAt) {
    final user = ref.read(userAuthProvider);
    final fs = ref.read(firestoreProvider);
    final listDoc = fs.doc('lists/$listId');
    tx.batch.update(listDoc, {
      '${_Fields.lastModified}.${user!.id}': modifiedAt.millisecondsSinceEpoch,
      _Fields.itemCount: FieldValue.increment(delta),
    });
  }
}

enum AcceptInviteResult {
  success,
  retryableError,
  unknownError,
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
    editors: List<UserAuth>.from(List<Map<String, dynamic>>.from(json['editors']).map(UserAuth.fromJson)),
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
