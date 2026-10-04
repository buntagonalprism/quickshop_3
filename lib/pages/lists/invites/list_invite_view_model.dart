import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../data/lists/application/list_invite_providers.dart';
import '../../../data/lists/application/lists_notifier.dart';
import '../../../data/lists/models/list_invite.dart';
import '../../../services/auth_service.dart';

part 'list_invite_view_model.freezed.dart';
part 'list_invite_view_model.g.dart';

/// The signed in user's relationship to an invite they have opened.
@freezed
sealed class InviteStatus with _$InviteStatus {
  const factory InviteStatus.isOwner(ListInvite invite) = _IsOwner;
  const factory InviteStatus.pending(ListInvite invite) = _Pending;
  const factory InviteStatus.accepted(ListInvite invite) = _Accepted;
}

/// The status of the invite with [inviteId], or null if there is no such invite.
@riverpod
AsyncValue<InviteStatus?> inviteStatus(Ref ref, String inviteId) {
  final inviteAsyncValue = ref.watch(listInviteByIdProvider(inviteId));
  final listsAsyncValue = ref.watch(listsProvider);
  final user = ref.watch(userAuthProvider);

  if (inviteAsyncValue.isLoading || listsAsyncValue.isLoading) {
    return const AsyncLoading();
  }

  if (inviteAsyncValue.hasError || listsAsyncValue.hasError) {
    if (inviteAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(inviteAsyncValue);
    }
    if (listsAsyncValue.hasError) {
      ref.read(crashReporterProvider).reportAsyncError(listsAsyncValue);
    }
    final AsyncValue<Object?> failed = inviteAsyncValue.hasError ? inviteAsyncValue : listsAsyncValue;
    return AsyncError(failed.error!, failed.stackTrace!);
  }

  final invite = inviteAsyncValue.requireValue;
  final lists = listsAsyncValue.requireValue;
  if (invite == null) {
    return const AsyncData(null);
  }

  if (invite.inviterId == user?.id) {
    return AsyncData(InviteStatus.isOwner(invite));
  }

  if (lists.any((list) => list.id == invite.listId)) {
    return AsyncData(InviteStatus.accepted(invite));
  }
  return AsyncData(InviteStatus.pending(invite));
}
