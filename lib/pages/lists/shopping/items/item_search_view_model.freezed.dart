// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_search_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ItemSuggestion {
  String get item;
  String get category;
  bool get isFromHistory;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemSuggestionCopyWith<ItemSuggestion> get copyWith =>
      _$ItemSuggestionCopyWithImpl<ItemSuggestion>(
          this as ItemSuggestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemSuggestion &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isFromHistory, isFromHistory) ||
                other.isFromHistory == isFromHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, category, isFromHistory);

  @override
  String toString() {
    return 'ItemSuggestion(item: $item, category: $category, isFromHistory: $isFromHistory)';
  }
}

/// @nodoc
abstract mixin class $ItemSuggestionCopyWith<$Res> {
  factory $ItemSuggestionCopyWith(
          ItemSuggestion value, $Res Function(ItemSuggestion) _then) =
      _$ItemSuggestionCopyWithImpl;
  @useResult
  $Res call({String item, String category, bool isFromHistory});
}

/// @nodoc
class _$ItemSuggestionCopyWithImpl<$Res>
    implements $ItemSuggestionCopyWith<$Res> {
  _$ItemSuggestionCopyWithImpl(this._self, this._then);

  final ItemSuggestion _self;
  final $Res Function(ItemSuggestion) _then;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? category = null,
    Object? isFromHistory = null,
  }) {
    return _then(_self.copyWith(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFromHistory: null == isFromHistory
          ? _self.isFromHistory
          : isFromHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [ItemSuggestion].
extension ItemSuggestionPatterns on ItemSuggestion {
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
    TResult Function(_ItemSuggestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion() when $default != null:
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
    TResult Function(_ItemSuggestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion():
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
    TResult? Function(_ItemSuggestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion() when $default != null:
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
    TResult Function(String item, String category, bool isFromHistory)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion() when $default != null:
        return $default(_that.item, _that.category, _that.isFromHistory);
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
    TResult Function(String item, String category, bool isFromHistory) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion():
        return $default(_that.item, _that.category, _that.isFromHistory);
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
    TResult? Function(String item, String category, bool isFromHistory)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemSuggestion() when $default != null:
        return $default(_that.item, _that.category, _that.isFromHistory);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ItemSuggestion extends ItemSuggestion {
  const _ItemSuggestion(
      {required this.item, required this.category, required this.isFromHistory})
      : super._();

  @override
  final String item;
  @override
  final String category;
  @override
  final bool isFromHistory;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemSuggestionCopyWith<_ItemSuggestion> get copyWith =>
      __$ItemSuggestionCopyWithImpl<_ItemSuggestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemSuggestion &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isFromHistory, isFromHistory) ||
                other.isFromHistory == isFromHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, category, isFromHistory);

  @override
  String toString() {
    return 'ItemSuggestion(item: $item, category: $category, isFromHistory: $isFromHistory)';
  }
}

/// @nodoc
abstract mixin class _$ItemSuggestionCopyWith<$Res>
    implements $ItemSuggestionCopyWith<$Res> {
  factory _$ItemSuggestionCopyWith(
          _ItemSuggestion value, $Res Function(_ItemSuggestion) _then) =
      __$ItemSuggestionCopyWithImpl;
  @override
  @useResult
  $Res call({String item, String category, bool isFromHistory});
}

/// @nodoc
class __$ItemSuggestionCopyWithImpl<$Res>
    implements _$ItemSuggestionCopyWith<$Res> {
  __$ItemSuggestionCopyWithImpl(this._self, this._then);

  final _ItemSuggestion _self;
  final $Res Function(_ItemSuggestion) _then;

  /// Create a copy of ItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
    Object? category = null,
    Object? isFromHistory = null,
  }) {
    return _then(_ItemSuggestion(
      item: null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isFromHistory: null == isFromHistory
          ? _self.isFromHistory
          : isFromHistory // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
