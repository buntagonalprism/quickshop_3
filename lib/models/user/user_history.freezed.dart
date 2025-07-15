// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserHistory {
  String get userId;
  DateTime get lastHistoryUpdate;
  HiddenSuggestions get hiddenSuggestions;

  /// Create a copy of UserHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserHistoryCopyWith<UserHistory> get copyWith =>
      _$UserHistoryCopyWithImpl<UserHistory>(this as UserHistory, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserHistory &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.lastHistoryUpdate, lastHistoryUpdate) ||
                other.lastHistoryUpdate == lastHistoryUpdate) &&
            (identical(other.hiddenSuggestions, hiddenSuggestions) ||
                other.hiddenSuggestions == hiddenSuggestions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, lastHistoryUpdate, hiddenSuggestions);

  @override
  String toString() {
    return 'UserHistory(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, hiddenSuggestions: $hiddenSuggestions)';
  }
}

/// @nodoc
abstract mixin class $UserHistoryCopyWith<$Res> {
  factory $UserHistoryCopyWith(
          UserHistory value, $Res Function(UserHistory) _then) =
      _$UserHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      DateTime lastHistoryUpdate,
      HiddenSuggestions hiddenSuggestions});

  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions;
}

/// @nodoc
class _$UserHistoryCopyWithImpl<$Res> implements $UserHistoryCopyWith<$Res> {
  _$UserHistoryCopyWithImpl(this._self, this._then);

  final UserHistory _self;
  final $Res Function(UserHistory) _then;

  /// Create a copy of UserHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? lastHistoryUpdate = null,
    Object? hiddenSuggestions = null,
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
      hiddenSuggestions: null == hiddenSuggestions
          ? _self.hiddenSuggestions
          : hiddenSuggestions // ignore: cast_nullable_to_non_nullable
              as HiddenSuggestions,
    ));
  }

  /// Create a copy of UserHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions {
    return $HiddenSuggestionsCopyWith<$Res>(_self.hiddenSuggestions, (value) {
      return _then(_self.copyWith(hiddenSuggestions: value));
    });
  }
}

/// Adds pattern-matching-related methods to [UserHistory].
extension UserHistoryPatterns on UserHistory {
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
            HiddenSuggestions hiddenSuggestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(
            _that.userId, _that.lastHistoryUpdate, _that.hiddenSuggestions);
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
            HiddenSuggestions hiddenSuggestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory():
        return $default(
            _that.userId, _that.lastHistoryUpdate, _that.hiddenSuggestions);
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
            HiddenSuggestions hiddenSuggestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserHistory() when $default != null:
        return $default(
            _that.userId, _that.lastHistoryUpdate, _that.hiddenSuggestions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _UserHistory extends UserHistory {
  const _UserHistory(
      {required this.userId,
      required this.lastHistoryUpdate,
      required this.hiddenSuggestions})
      : super._();

  @override
  final String userId;
  @override
  final DateTime lastHistoryUpdate;
  @override
  final HiddenSuggestions hiddenSuggestions;

  /// Create a copy of UserHistory
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
            (identical(other.hiddenSuggestions, hiddenSuggestions) ||
                other.hiddenSuggestions == hiddenSuggestions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, lastHistoryUpdate, hiddenSuggestions);

  @override
  String toString() {
    return 'UserHistory(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, hiddenSuggestions: $hiddenSuggestions)';
  }
}

/// @nodoc
abstract mixin class _$UserHistoryCopyWith<$Res>
    implements $UserHistoryCopyWith<$Res> {
  factory _$UserHistoryCopyWith(
          _UserHistory value, $Res Function(_UserHistory) _then) =
      __$UserHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      DateTime lastHistoryUpdate,
      HiddenSuggestions hiddenSuggestions});

  @override
  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions;
}

/// @nodoc
class __$UserHistoryCopyWithImpl<$Res> implements _$UserHistoryCopyWith<$Res> {
  __$UserHistoryCopyWithImpl(this._self, this._then);

  final _UserHistory _self;
  final $Res Function(_UserHistory) _then;

  /// Create a copy of UserHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? lastHistoryUpdate = null,
    Object? hiddenSuggestions = null,
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
      hiddenSuggestions: null == hiddenSuggestions
          ? _self.hiddenSuggestions
          : hiddenSuggestions // ignore: cast_nullable_to_non_nullable
              as HiddenSuggestions,
    ));
  }

  /// Create a copy of UserHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HiddenSuggestionsCopyWith<$Res> get hiddenSuggestions {
    return $HiddenSuggestionsCopyWith<$Res>(_self.hiddenSuggestions, (value) {
      return _then(_self.copyWith(hiddenSuggestions: value));
    });
  }
}

/// @nodoc
mixin _$HiddenSuggestions {
  List<String> get items;
  List<String> get categories;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HiddenSuggestionsCopyWith<HiddenSuggestions> get copyWith =>
      _$HiddenSuggestionsCopyWithImpl<HiddenSuggestions>(
          this as HiddenSuggestions, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HiddenSuggestions &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'HiddenSuggestions(items: $items, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $HiddenSuggestionsCopyWith<$Res> {
  factory $HiddenSuggestionsCopyWith(
          HiddenSuggestions value, $Res Function(HiddenSuggestions) _then) =
      _$HiddenSuggestionsCopyWithImpl;
  @useResult
  $Res call({List<String> items, List<String> categories});
}

/// @nodoc
class _$HiddenSuggestionsCopyWithImpl<$Res>
    implements $HiddenSuggestionsCopyWith<$Res> {
  _$HiddenSuggestionsCopyWithImpl(this._self, this._then);

  final HiddenSuggestions _self;
  final $Res Function(HiddenSuggestions) _then;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HiddenSuggestions].
extension HiddenSuggestionsPatterns on HiddenSuggestions {
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
    TResult Function(_HiddenSuggestions value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions() when $default != null:
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
    TResult Function(_HiddenSuggestions value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions():
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
    TResult? Function(_HiddenSuggestions value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions() when $default != null:
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
    TResult Function(List<String> items, List<String> categories)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions() when $default != null:
        return $default(_that.items, _that.categories);
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
    TResult Function(List<String> items, List<String> categories) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions():
        return $default(_that.items, _that.categories);
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
    TResult? Function(List<String> items, List<String> categories)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HiddenSuggestions() when $default != null:
        return $default(_that.items, _that.categories);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HiddenSuggestions extends HiddenSuggestions {
  const _HiddenSuggestions(
      {required final List<String> items,
      required final List<String> categories})
      : _items = items,
        _categories = categories,
        super._();

  final List<String> _items;
  @override
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HiddenSuggestionsCopyWith<_HiddenSuggestions> get copyWith =>
      __$HiddenSuggestionsCopyWithImpl<_HiddenSuggestions>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HiddenSuggestions &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'HiddenSuggestions(items: $items, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$HiddenSuggestionsCopyWith<$Res>
    implements $HiddenSuggestionsCopyWith<$Res> {
  factory _$HiddenSuggestionsCopyWith(
          _HiddenSuggestions value, $Res Function(_HiddenSuggestions) _then) =
      __$HiddenSuggestionsCopyWithImpl;
  @override
  @useResult
  $Res call({List<String> items, List<String> categories});
}

/// @nodoc
class __$HiddenSuggestionsCopyWithImpl<$Res>
    implements _$HiddenSuggestionsCopyWith<$Res> {
  __$HiddenSuggestionsCopyWithImpl(this._self, this._then);

  final _HiddenSuggestions _self;
  final $Res Function(_HiddenSuggestions) _then;

  /// Create a copy of HiddenSuggestions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? categories = null,
  }) {
    return _then(_HiddenSuggestions(
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
