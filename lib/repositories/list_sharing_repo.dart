import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../analytics/analytics.dart';
import '../models/list_invite.dart';
import '../models/list_summary.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'user_repo.dart';

part 'list_sharing_repo.g.dart';

/// A repository that handles sharing lists with other users. The output of this repository
/// is a [ListInvite] object that represents the sharing link for a given list, if it exists.
@riverpod
class ListSharingRepo extends _$ListSharingRepo {
  @override
  Stream<ListInvite?> build(String listId) {
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
