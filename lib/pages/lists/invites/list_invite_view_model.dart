import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../application/list_invite_providers.dart';
import '../../../application/lists_notifier.dart';
import '../../../application/user_notifier.dart';
import '../../../models/list_invite.dart';

part 'list_invite_view_model.freezed.dart';
part 'list_invite_view_model.g.dart';

@freezed
class ListInviteViewModel with _$ListInviteViewModel {
  const ListInviteViewModel._();

  const factory ListInviteViewModel.loading() = _Loading;
  const factory ListInviteViewModel.error() = _Error;
  const factory ListInviteViewModel.notFound() = _NotFound;
  const factory ListInviteViewModel.isOwner(ListInvite invite) = _IsOwner;
  const factory ListInviteViewModel.pending(ListInvite invite) = _Pending;
  const factory ListInviteViewModel.accepted(ListInvite invite) = _Accepted;
}

@riverpod
ListInviteViewModel listInviteState(Ref ref, String inviteId) {
  final inviteAsyncValue = ref.watch(listInviteByIdProvider(inviteId));
  final listsAsyncValue = ref.watch(listsNotifierProvider);
  final user = ref.watch(userNotifierProvider);

  if (inviteAsyncValue.isLoading || listsAsyncValue.isLoading) {
    return const ListInviteViewModel.loading();
  }

  if (inviteAsyncValue.hasError || listsAsyncValue.hasError) {
    if (inviteAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(inviteAsyncValue);
    }
    if (listsAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(listsAsyncValue);
    }
    return const ListInviteViewModel.error();
  }

  final invite = inviteAsyncValue.requireValue;
  final lists = listsAsyncValue.requireValue;
  if (invite == null) {
    return const ListInviteViewModel.notFound();
  }

  if (invite.inviterId == user?.id) {
    return ListInviteViewModel.isOwner(invite);
  }

  if (lists.any((list) => list.id == invite.listId)) {
    return ListInviteViewModel.accepted(invite);
  }
  return ListInviteViewModel.pending(invite);
}
