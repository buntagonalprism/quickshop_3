// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {
  String get userId;
  DateTime get lastHistoryUpdate;
  int get lastHiddenSuggestionsVersion;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastHistoryUpdate, lastHistoryUpdate) ||
                other.lastHistoryUpdate == lastHistoryUpdate) &&
            (identical(other.lastHiddenSuggestionsVersion,
                    lastHiddenSuggestionsVersion) ||
                other.lastHiddenSuggestionsVersion ==
                    lastHiddenSuggestionsVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userId, lastHistoryUpdate, lastHiddenSuggestionsVersion);

  @override
  String toString() {
    return 'UserProfile(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, lastHiddenSuggestionsVersion: $lastHiddenSuggestionsVersion)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) _then) =
      _$UserProfileCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      DateTime lastHistoryUpdate,
      int lastHiddenSuggestionsVersion});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastHistoryUpdate = null,
    Object? lastHiddenSuggestionsVersion = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lastHistoryUpdate: null == lastHistoryUpdate
          ? _self.lastHistoryUpdate
          : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastHiddenSuggestionsVersion: null == lastHiddenSuggestionsVersion
          ? _self.lastHiddenSuggestionsVersion
          : lastHiddenSuggestionsVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, DateTime lastHistoryUpdate,
            int lastHiddenSuggestionsVersion)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(_that.userId, _that.lastHistoryUpdate,
            _that.lastHiddenSuggestionsVersion);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, DateTime lastHistoryUpdate,
            int lastHiddenSuggestionsVersion)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory():
        return $default(_that.userId, _that.lastHistoryUpdate,
            _that.lastHiddenSuggestionsVersion);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, DateTime lastHistoryUpdate,
            int lastHiddenSuggestionsVersion)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(_that.userId, _that.lastHistoryUpdate,
            _that.lastHiddenSuggestionsVersion);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserHistory extends UserProfile {
  const _UserHistory(
      {required this.userId,
      required this.lastHistoryUpdate,
      required this.lastHiddenSuggestionsVersion})
      : super._();

  @override
  final String userId;
  @override
  final DateTime lastHistoryUpdate;
  @override
  final int lastHiddenSuggestionsVersion;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserHistoryCopyWith<_UserHistory> get copyWith =>
      __$UserHistoryCopyWithImpl<_UserHistory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserHistory &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastHistoryUpdate, lastHistoryUpdate) ||
                other.lastHistoryUpdate == lastHistoryUpdate) &&
            (identical(other.lastHiddenSuggestionsVersion,
                    lastHiddenSuggestionsVersion) ||
                other.lastHiddenSuggestionsVersion ==
                    lastHiddenSuggestionsVersion));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userId, lastHistoryUpdate, lastHiddenSuggestionsVersion);

  @override
  String toString() {
    return 'UserProfile(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, lastHiddenSuggestionsVersion: $lastHiddenSuggestionsVersion)';
  }
}

/// @nodoc
abstract mixin class _$UserHistoryCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserHistoryCopyWith(
          _UserHistory value, $Res Function(_UserHistory) _then) =
      __$UserHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      DateTime lastHistoryUpdate,
      int lastHiddenSuggestionsVersion});
}

/// @nodoc
class __$UserHistoryCopyWithImpl<$Res> implements _$UserHistoryCopyWith<$Res> {
  __$UserHistoryCopyWithImpl(this._self, this._then);

  final _UserHistory _self;
  final $Res Function(_UserHistory) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? lastHistoryUpdate = null,
    Object? lastHiddenSuggestionsVersion = null,
  }) {
    return _then(_UserHistory(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      lastHistoryUpdate: null == lastHistoryUpdate
          ? _self.lastHistoryUpdate
          : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastHiddenSuggestionsVersion: null == lastHiddenSuggestionsVersion
          ? _self.lastHiddenSuggestionsVersion
          : lastHiddenSuggestionsVersion // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
