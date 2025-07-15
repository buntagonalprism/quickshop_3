// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingCategorySuggestion {
  String get id;
  String get locale;
  String get name;
  int? get popularity;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShoppingCategorySuggestionCopyWith<ShoppingCategorySuggestion>
      get copyWith =>
          _$ShoppingCategorySuggestionCopyWithImpl<ShoppingCategorySuggestion>(
              this as ShoppingCategorySuggestion, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingCategorySuggestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, locale, name, popularity);

  @override
  String toString() {
    return 'ShoppingCategorySuggestion(id: $id, locale: $locale, name: $name, popularity: $popularity)';
  }
}

/// @nodoc
abstract mixin class $ShoppingCategorySuggestionCopyWith<$Res> {
  factory $ShoppingCategorySuggestionCopyWith(ShoppingCategorySuggestion value,
          $Res Function(ShoppingCategorySuggestion) _then) =
      _$ShoppingCategorySuggestionCopyWithImpl;
  @useResult
  $Res call({String id, String locale, String name, int? popularity});
}

/// @nodoc
class _$ShoppingCategorySuggestionCopyWithImpl<$Res>
    implements $ShoppingCategorySuggestionCopyWith<$Res> {
  _$ShoppingCategorySuggestionCopyWithImpl(this._self, this._then);

  final ShoppingCategorySuggestion _self;
  final $Res Function(ShoppingCategorySuggestion) _then;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? locale = null,
    Object? name = null,
    Object? popularity = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: freezed == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShoppingCategorySuggestion].
extension ShoppingCategorySuggestionPatterns on ShoppingCategorySuggestion {
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
    TResult Function(_ShoppingCategorySuggestion value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion() when $default != null:
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
    TResult Function(_ShoppingCategorySuggestion value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion():
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
    TResult? Function(_ShoppingCategorySuggestion value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion() when $default != null:
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
    TResult Function(String id, String locale, String name, int? popularity)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion() when $default != null:
        return $default(_that.id, _that.locale, _that.name, _that.popularity);
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
    TResult Function(String id, String locale, String name, int? popularity)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion():
        return $default(_that.id, _that.locale, _that.name, _that.popularity);
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
    TResult? Function(String id, String locale, String name, int? popularity)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingCategorySuggestion() when $default != null:
        return $default(_that.id, _that.locale, _that.name, _that.popularity);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShoppingCategorySuggestion extends ShoppingCategorySuggestion {
  const _ShoppingCategorySuggestion(
      {required this.id,
      required this.locale,
      required this.name,
      this.popularity})
      : super._();

  @override
  final String id;
  @override
  final String locale;
  @override
  final String name;
  @override
  final int? popularity;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShoppingCategorySuggestionCopyWith<_ShoppingCategorySuggestion>
      get copyWith => __$ShoppingCategorySuggestionCopyWithImpl<
          _ShoppingCategorySuggestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShoppingCategorySuggestion &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, locale, name, popularity);

  @override
  String toString() {
    return 'ShoppingCategorySuggestion(id: $id, locale: $locale, name: $name, popularity: $popularity)';
  }
}

/// @nodoc
abstract mixin class _$ShoppingCategorySuggestionCopyWith<$Res>
    implements $ShoppingCategorySuggestionCopyWith<$Res> {
  factory _$ShoppingCategorySuggestionCopyWith(
          _ShoppingCategorySuggestion value,
          $Res Function(_ShoppingCategorySuggestion) _then) =
      __$ShoppingCategorySuggestionCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String locale, String name, int? popularity});
}

/// @nodoc
class __$ShoppingCategorySuggestionCopyWithImpl<$Res>
    implements _$ShoppingCategorySuggestionCopyWith<$Res> {
  __$ShoppingCategorySuggestionCopyWithImpl(this._self, this._then);

  final _ShoppingCategorySuggestion _self;
  final $Res Function(_ShoppingCategorySuggestion) _then;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? locale = null,
    Object? name = null,
    Object? popularity = freezed,
  }) {
    return _then(_ShoppingCategorySuggestion(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _self.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: freezed == popularity
          ? _self.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
