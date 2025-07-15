// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingCategoryHistory {
  String get id;
  String get name;
  String get nameLower;
  int get usageCount;
  DateTime get lastUsed;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShoppingCategoryHistoryCopyWith<ShoppingCategoryHistory> get copyWith =>
      _$ShoppingCategoryHistoryCopyWithImpl<ShoppingCategoryHistory>(
          this as ShoppingCategoryHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCategoryHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameLower, nameLower) ||
                other.nameLower == nameLower) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, nameLower, usageCount, lastUsed);

  @override
  String toString() {
    return 'ShoppingCategoryHistory(id: $id, name: $name, nameLower: $nameLower, usageCount: $usageCount, lastUsed: $lastUsed)';
  }
}

/// @nodoc
abstract mixin class $ShoppingCategoryHistoryCopyWith<$Res> {
  factory $ShoppingCategoryHistoryCopyWith(ShoppingCategoryHistory value,
          $Res Function(ShoppingCategoryHistory) _then) =
      _$ShoppingCategoryHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String nameLower,
      int usageCount,
      DateTime lastUsed});
}

/// @nodoc
class _$ShoppingCategoryHistoryCopyWithImpl<$Res>
    implements $ShoppingCategoryHistoryCopyWith<$Res> {
  _$ShoppingCategoryHistoryCopyWithImpl(this._self, this._then);

  final ShoppingCategoryHistory _self;
  final $Res Function(ShoppingCategoryHistory) _then;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameLower = null,
    Object? usageCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameLower: null == nameLower
          ? _self.nameLower
          : nameLower // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _self.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _self.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShoppingCategoryHistory].
extension ShoppingCategoryHistoryPatterns on ShoppingCategoryHistory {
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
    TResult Function(_ShoppingCategoryHistory value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory() when $default != null:
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
    TResult Function(_ShoppingCategoryHistory value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory():
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
    TResult? Function(_ShoppingCategoryHistory value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory() when $default != null:
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
    TResult Function(String id, String name, String nameLower, int usageCount,
            DateTime lastUsed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory() when $default != null:
        return $default(_that.id, _that.name, _that.nameLower, _that.usageCount,
            _that.lastUsed);
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
    TResult Function(String id, String name, String nameLower, int usageCount,
            DateTime lastUsed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory():
        return $default(_that.id, _that.name, _that.nameLower, _that.usageCount,
            _that.lastUsed);
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
    TResult? Function(String id, String name, String nameLower, int usageCount,
            DateTime lastUsed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategoryHistory() when $default != null:
        return $default(_that.id, _that.name, _that.nameLower, _that.usageCount,
            _that.lastUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShoppingCategoryHistory extends ShoppingCategoryHistory {
  const _ShoppingCategoryHistory(
      {required this.id,
      required this.name,
      required this.nameLower,
      required this.usageCount,
      required this.lastUsed})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameLower;
  @override
  final int usageCount;
  @override
  final DateTime lastUsed;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShoppingCategoryHistoryCopyWith<_ShoppingCategoryHistory> get copyWith =>
      __$ShoppingCategoryHistoryCopyWithImpl<_ShoppingCategoryHistory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShoppingCategoryHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameLower, nameLower) ||
                other.nameLower == nameLower) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, nameLower, usageCount, lastUsed);

  @override
  String toString() {
    return 'ShoppingCategoryHistory(id: $id, name: $name, nameLower: $nameLower, usageCount: $usageCount, lastUsed: $lastUsed)';
  }
}

/// @nodoc
abstract mixin class _$ShoppingCategoryHistoryCopyWith<$Res>
    implements $ShoppingCategoryHistoryCopyWith<$Res> {
  factory _$ShoppingCategoryHistoryCopyWith(_ShoppingCategoryHistory value,
          $Res Function(_ShoppingCategoryHistory) _then) =
      __$ShoppingCategoryHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameLower,
      int usageCount,
      DateTime lastUsed});
}

/// @nodoc
class __$ShoppingCategoryHistoryCopyWithImpl<$Res>
    implements _$ShoppingCategoryHistoryCopyWith<$Res> {
  __$ShoppingCategoryHistoryCopyWithImpl(this._self, this._then);

  final _ShoppingCategoryHistory _self;
  final $Res Function(_ShoppingCategoryHistory) _then;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameLower = null,
    Object? usageCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_ShoppingCategoryHistory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameLower: null == nameLower
          ? _self.nameLower
          : nameLower // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _self.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _self.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
