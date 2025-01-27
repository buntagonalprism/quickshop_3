import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sortable.freezed.dart';

/// A class of objects that can be manually sorted by a user. Intended for use in distributed
/// scenarios where multiple clients may be sorting the same list of items at the same time, and
/// with the goal that moving a single item should not require updating the entire list.
abstract class UserSortable {
  UserSortKey get sortKey;
  String get sortFallback;
}

final _segmentMax = int.parse('zzzz', radix: 36);
final _segmentMiddle = _segmentMax ~/ 2;
const _seperator = '-';

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

  factory UserSortKey.between(UserSortKey first, UserSortKey second) {
    if (first.primary + 1 < second.primary) {
      return UserSortKey(
        primary: first.primary + 1,
        secondary: '',
      );
    }

    final firstUnseperated = first.secondary.replaceAll(_seperator, '');
    final secondUnseperated = second.secondary.replaceAll(_seperator, '');
    final maxLength = math.max(firstUnseperated.length, secondUnseperated.length);
    if (maxLength == 0) {
      return UserSortKey(
        primary: first.primary,
        secondary: _addSeparator(_segmentMiddle.toRadixString(36)),
      );
    }
    final firstPadded = firstUnseperated.padRight(maxLength, '0');
    final secondPadded = secondUnseperated.padRight(maxLength, 'z');
    final firstInt = BigInt.parse(firstPadded, radix: 36);
    final secondInt = BigInt.parse(secondPadded, radix: 36);
    final diff = secondInt - firstInt;
    // If there is no gap, add a new segment
    if (diff <= BigInt.from(1)) {
      return UserSortKey(
        primary: first.primary,
        secondary: _addSeparator(firstPadded + _segmentMiddle.toRadixString(36)),
      );
    }
    final middle = (firstInt + secondInt) ~/ BigInt.from(2);

    return UserSortKey(
      primary: first.primary,
      secondary: _addSeparator(middle.toRadixString(36).padLeft(maxLength, '0')),
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

/// Adds a separator between every four digits in the secondary sort key.
String _addSeparator(String secondary) {
  final segments = <String>[];
  for (var i = 0; i < secondary.length; i += 4) {
    segments.add(secondary.substring(i, i + 4));
  }
  return segments.join(_seperator);
}
