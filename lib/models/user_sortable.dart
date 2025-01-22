import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sortable.freezed.dart';

abstract class UserSortable {
  UserSortKey get sortKey;
  String get sortFallback;
}

@freezed
class UserSortKey with _$UserSortKey {
  const UserSortKey._();

  const factory UserSortKey({
    required int primary,
    required String secondary,
  }) = _UserSortKey;
}
