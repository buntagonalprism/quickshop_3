import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sortable.freezed.dart';

/// A class of objects that can be manually sorted by a user.
///
/// Intended for use in distributed scenarios where multiple clients may be sorting the same list of
/// items at the same time, and with the goal that moving a single item should not require updating
/// sort indexes across the entire list of objects.
///
/// The [UserSortKey] is the intented way to sort the objects. The [sortFallback] is a string that
/// can be used to sort the objects is case of a duplicate [sortKey], ensuring a stable sort order.
/// Duplicate [sortKey] values should only occur in the case of concurrent updates from multiple
/// clients; no update by a single client should result in duplicate sort key values.
abstract class UserSortable {
  UserSortKey get sortKey;
  String get sortFallback;
}

final _segmentMax = int.parse('zzzz', radix: 36);
final _segmentMiddle = _segmentMax ~/ 2;
const _seperator = '-';

/// The [UserSortKey] handles the implementation of sorting objects that implement [UserSortable].
///
/// Use [UserSortKey.between] to find a sort key that is between two other sort keys.
/// Use the [UserSortableExtension.userSort] extension method to sort a list of [UserSortable]
/// objects by their [UserSortKey] values.
///
/// Implementation approach:
/// - The primary sort key is an integer. When objects are appended to the end of a list of
///   [UserSortable] objects, or inserted at the beginning, they should be given a primary sort key
///   either one greater than the last object, or one less than the first object, respectively.
/// - The secondary sort key is a string that is used to maintain sort order when objects are
///   inserted between two other objects with the same primary sort key, or if there is only a unit
///   difference in the primary sort keys. The string is the base 36 representation of a number,
///   broken up into 4-digit segments. Each segment ranges in value from 0000 to zzzz.
///
/// The following sort keys are in order:
/// ```dart
/// [
///   UserSortKey(primary: -4, secondary: ''),
///   UserSortKey(primary: 0, secondary: ''),
///   UserSortKey(primary: 1, secondary: ''),
///   UserSortKey(primary: 1, secondary: '0000'),
///   UserSortKey(primary: 1, secondary: '0001'),
///   UserSortKey(primary: 1, secondary: '0001-1234'),
///   UserSortKey(primary: 1, secondary: '0001-1235'),
///   UserSortKey(primary: 1, secondary: '0002'),
///   UserSortKey(primary: 1, secondary: 'hzzz'),
///   UserSortKey(primary: 1, secondary: 'zzzz'),
///   UserSortKey(primary: 1, secondary: 'zzzz-zzzz'),
///   UserSortKey(primary: 2, secondary: ''),
///   UserSortKey(primary: 23, secondary: '1234'),
/// ];
@freezed
abstract class UserSortKey with _$UserSortKey {
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

  /// Returns a sort key that will be sorted between the two provided sort keys.
  ///
  /// - If there is a gap between the primary sort keys, the new sort key will have the primary sort
  ///   key one larger than [first]
  /// - If there is no gap between the primary sort keys, the new sort key will have the same primary
  ///   sort key as [first], and the secondary sort key will be the median between the two provided
  ///   secondary sort keys.
  /// - If there is no gap between the secondary sort keys, a new segment will be added with the
  ///   median segment value of hzzz - i.e. the median between 0000 and zzzz in base 36.
  /// - If the two sort keys are identical, an [ArgumentError] will be thrown, since there is no way
  ///   to create a sort key between them. In this case, the [UserSortKey.subdivide] method should
  ///   be used instead to generate new sort keys for all the objects with the same sort key.
  ///
  /// For example:
  /// ```dart
  /// // returns UserSortKey(primary: 3, secondary: '')
  /// UserSortKey.between(
  ///   UserSortKey(primary: 2, secondary: '1234'),
  ///   UserSortKey(primary: 5, secondary: '1235'),
  /// );
  ///
  /// // returns UserSortKey(primary: 1, secondary: 'hzzz')
  /// UserSortKey.between(
  ///   UserSortKey(primary: 1, secondary: ''),
  ///   UserSortKey(primary: 2, secondary: ''),
  /// );
  ///
  /// // returns UserSortKey(primary: 1, secondary: '1005')
  /// UserSortKey.between(
  ///   UserSortKey(primary: 1, secondary: '1003'),
  ///   UserSortKey(primary: 2, secondary: '1007'),
  /// );
  ///
  /// // returns UserSortKey(primary: 1, secondary: '1234-hzzz')
  /// UserSortKey.between(
  ///   UserSortKey(primary: 1, secondary: '1234'),
  ///   UserSortKey(primary: 1, secondary: '1235'),
  /// );
  /// ```
  factory UserSortKey.between(UserSortKey first, UserSortKey second) {
    if (first == second) {
      throw ArgumentError('Cannot find a value between two identical sort keys');
    }
    if (first.primary + 1 < second.primary) {
      return UserSortKey(
        primary: first.primary + 1,
        secondary: '',
      );
    }

    final firstUnseperated = first.secondary.replaceAll(_seperator, '');

    // If the primary gap is exactly one, treat the second as though it has the same primary and the
    // maximum value of the secondary for the purpose of finding a median
    String secondUnseperated;
    if (first.primary + 1 == second.primary) {
      secondUnseperated = List.filled(firstUnseperated.length, 'z').join();
    } else {
      secondUnseperated = second.secondary.replaceAll(_seperator, '');
    }

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

  /// Subdivides an existing sort key into a list of [UserSortKey] objects with an additional
  /// secondary sort key segment appended. The added segment is equally subdivided [intervals] times
  /// across the range of possible values for the segment.
  ///
  /// This method is useful when a new object is to be inserted between two or more objects with the
  /// same sort key; a situation that can occur if multiple clients concurrently edit a list. The
  /// count of [intervals] should be equal to the number of existing objects with the same sort key,
  /// plus one for the new object being inserted.
  ///
  /// For example:
  /// ```dart
  /// UserSortKey(primary: 3, secondary: 'ab12').subdivide(5) == [
  ///   UserSortKey(primary: 1, secondary: 'ab12-5zzz'),
  ///   UserSortKey(primary: 1, secondary: 'ab12-bzzy'),
  ///   UserSortKey(primary: 1, secondary: 'ab12-hzzx'),
  ///   UserSortKey(primary: 1, secondary: 'ab12-nzzw'),
  ///   UserSortKey(primary: 1, secondary: 'ab12-tzzv'),
  /// ];
  List<UserSortKey> subdivide(int intervals) {
    if (intervals < 1) {
      throw ArgumentError('intervals must be greater than 0');
    }
    if (intervals == 1) {
      return [this];
    }
    final existingSegments = secondary.split(_seperator)..removeWhere((element) => element.isEmpty);
    final segmentIncrement = _segmentMax ~/ (intervals + 1);
    final keys = <UserSortKey>[];
    for (var i = 0; i < intervals; i++) {
      final newSegment = (segmentIncrement * (i + 1)).toRadixString(36);
      keys.add(UserSortKey(
        primary: primary,
        secondary: [...existingSegments, newSegment].join(_seperator),
      ));
    }
    return keys;
  }
}

extension UserSortableExtension on List<UserSortable> {
  /// Sorts the list of [UserSortable] objects by their [UserSortKey], or otherwise by their
  /// [sortFallback] value.
  void userSort() {
    return sort((a, b) {
      final primary = a.sortKey.primary.compareTo(b.sortKey.primary);
      if (primary != 0) {
        return primary;
      }
      final secondary = a.sortKey.secondary.compareTo(b.sortKey.secondary);
      if (secondary != 0) {
        return secondary;
      }
      return a.sortFallback.compareTo(b.sortFallback);
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
