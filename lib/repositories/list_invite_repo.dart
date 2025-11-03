import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../analytics/analytics.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../services/firestore.dart';
import 'user_repo.dart';

part 'list_invite_repo.g.dart';

@riverpod
ListInviteRepo listInviteRepo(Ref ref) {
  return ListInviteRepo(ref);
}

/// A repository for managing the creation and deletion of list invites.

class ListInviteRepo {
  ListInviteRepo(this.ref);
  final Ref ref;

  Future<void> createSharingLinkForList(ListSummary list) async {
    final user = ref.read(userRepoProvider);
    if (user == null) {
      throw Exception('User must be logged in to share a list');
    }
    final fs = ref.read(firestoreProvider);
    final invite = ListInvite(
      id: const Uuid().v4(),
      listId: list.id,
      listType: list.listType,
      listName: list.name,
      inviterId: user.id,
      inviterName: user.name.isNotEmpty ? user.name : user.email,
    );
    await fs.collection('invites').doc(invite.id).set(_toFirestore(invite));
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listInviteCreated(list.listType));
  }

  Future<void> deleteSharingLink(ListInvite invite) async {
    final fs = ref.read(firestoreProvider);
    await fs.collection('invites').doc(invite.id).delete();
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listInviteDeleted(invite.listType));
  }

  Stream<ListInvite?> listInviteById(String inviteId) {
    final fs = ref.read(firestoreProvider);
    return fs.collection('invites').doc(inviteId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return null;
      }
      return _fromFirestore(snapshot);
    });
  }

  Stream<ListInvite?> userListInviteByListId(String listId) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    if (user == null) {
      return const Stream.empty();
    }
    return fs
        .collection('invites')
        .where('listId', isEqualTo: listId)
        .where('inviterId', isEqualTo: user.id)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      final doc = snapshot.docs.first;
      return _fromFirestore(doc);
    });
  }
}

ListInvite _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  return ListInvite(
    id: doc.id,
    listId: doc['listId'],
    listType: parseListType(doc['listType']),
    listName: doc['listName'],
    inviterId: doc['inviterId'],
    inviterName: doc['inviterName'],
  );
}

Map<String, dynamic> _toFirestore(ListInvite invite) {
  return {
    'listId': invite.listId,
    'listType': invite.listType.name,
    'listName': invite.listName,
    'inviterId': invite.inviterId,
    'inviterName': invite.inviterName,
  };
}
