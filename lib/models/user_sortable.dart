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

  Map<String, dynamic> toJson() {
    return {
      'primary': primary,
      'secondary': secondary,
    };
  }

  factory UserSortKey.fromJson(Map<String, dynamic> json) {
    return UserSortKey(
      primary: json['primary'] as int,
      secondary: json['secondary'] as String,
    );
  }
}
