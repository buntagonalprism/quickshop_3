import 'package:freezed_annotation/freezed_annotation.dart';

import 'list_summary.dart';

part 'list_invite.freezed.dart';

@freezed
class ListInvite with _$ListInvite {
  const ListInvite._();

  const factory ListInvite({
    required String id,
    required String listId,
    required ListType listType,
    required String listName,
    required String inviterId,
    required String inviterName,
  }) = _ListInvite;

  String get url =>
      'https://${const String.fromEnvironment('QUICKSHOP_WEB_HOST')}/lists/invites/$id';
}
