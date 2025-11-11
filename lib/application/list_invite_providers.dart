import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_invite.dart';
import '../repositories/delay_provider_dispose.dart';
import '../repositories/list_invite_repo.dart';

part 'list_invite_providers.g.dart';

/// Load a list invite by its id.
///
/// Will return null if the invite does not exist.
@riverpod
Stream<ListInvite?> listInviteById(Ref ref, String inviteId) {
  return ref.read(listInviteRepoProvider).listInviteById(inviteId);
}

/// Load the currently authenticated user's personal list invite for sharing a given list.
///
/// Will return null if the user has not created a sharing link for the list.
@riverpod
Stream<ListInvite?> userListInviteByListId(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 5));
  return ref.read(listInviteRepoProvider).userListInviteByListId(listId);
}
