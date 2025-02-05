import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../analytics/analytics.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'user_repo.dart';

part 'list_invite_repo.g.dart';

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.
@riverpod
Stream<ListInvite?> listInviteById(Ref ref, String inviteId) {
  final fs = ref.read(firestoreProvider);
  return fs.collection('invites').doc(inviteId).snapshots().map((snapshot) {
    if (!snapshot.exists) {
      return null;
    }
    return ListInvite.fromFirestore(snapshot);
  });
}

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.
@riverpod
Stream<ListInvite?> userListInviteByListId(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 5));
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
    return ListInvite.fromFirestore(doc);
  });
}

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
    await fs.collection('invites').doc(invite.id).set(invite.toFirestore());
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listInviteCreated(list.listType));
  }

  Future<void> deleteSharingLink(ListInvite invite) async {
    final fs = ref.read(firestoreProvider);
    await fs.collection('invites').doc(invite.id).delete();
    ref.read(analyticsProvider).logEvent(AnalyticsEvent.listInviteDeleted(invite.listType));
  }
}
