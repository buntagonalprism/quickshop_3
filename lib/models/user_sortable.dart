import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sortable.freezed.dart';

/// A class of objects that can be manually sorted by a user. Intended for use in distributed
/// scenarios where multiple clients may be sorting the same list of items at the same time, and
/// with the goal that moving a single item should not require updating the entire list.
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

extension UserSortableExtension on List<UserSortable> {
  /// Sorts the list of [UserSortable] objects by their [UserSortKey]
  void userSort() {
    return sort((a, b) {
      final primary = a.sortKey.primary.compareTo(b.sortKey.primary);
      if (primary != 0) {
        return primary;
      }
      return a.sortKey.secondary.compareTo(b.sortKey.secondary);
    });
  }
}
