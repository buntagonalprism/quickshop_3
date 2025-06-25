// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCategorySuggestion {
  String get name => throw _privateConstructorUsedError;
  ShoppingCategorySuggestionSource get source =>
      throw _privateConstructorUsedError;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingCategorySuggestionCopyWith<ShoppingCategorySuggestion>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCategorySuggestionCopyWith<$Res> {
  factory $ShoppingCategorySuggestionCopyWith(ShoppingCategorySuggestion value,
          $Res Function(ShoppingCategorySuggestion) then) =
      _$ShoppingCategorySuggestionCopyWithImpl<$Res,
          ShoppingCategorySuggestion>;
  @useResult
  $Res call({String name, ShoppingCategorySuggestionSource source});
}

/// @nodoc
class _$ShoppingCategorySuggestionCopyWithImpl<$Res,
        $Val extends ShoppingCategorySuggestion>
    implements $ShoppingCategorySuggestionCopyWith<$Res> {
  _$ShoppingCategorySuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingCategorySuggestionSource,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemCategorySuggestionImplCopyWith<$Res>
    implements $ShoppingCategorySuggestionCopyWith<$Res> {
  factory _$$ShoppingItemCategorySuggestionImplCopyWith(
          _$ShoppingItemCategorySuggestionImpl value,
          $Res Function(_$ShoppingItemCategorySuggestionImpl) then) =
      __$$ShoppingItemCategorySuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, ShoppingCategorySuggestionSource source});
}

/// @nodoc
class __$$ShoppingItemCategorySuggestionImplCopyWithImpl<$Res>
    extends _$ShoppingCategorySuggestionCopyWithImpl<$Res,
        _$ShoppingItemCategorySuggestionImpl>
    implements _$$ShoppingItemCategorySuggestionImplCopyWith<$Res> {
  __$$ShoppingItemCategorySuggestionImplCopyWithImpl(
      _$ShoppingItemCategorySuggestionImpl _value,
      $Res Function(_$ShoppingItemCategorySuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? source = null,
  }) {
    return _then(_$ShoppingItemCategorySuggestionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingCategorySuggestionSource,
    ));
  }
}

/// @nodoc

class _$ShoppingItemCategorySuggestionImpl
    extends _ShoppingItemCategorySuggestion {
  const _$ShoppingItemCategorySuggestionImpl(
      {required this.name, required this.source})
      : super._();

  @override
  final String name;
  @override
  final ShoppingCategorySuggestionSource source;

  @override
  String toString() {
    return 'ShoppingCategorySuggestion(name: $name, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemCategorySuggestionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.source, source) || other.source == source));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, source);

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemCategorySuggestionImplCopyWith<
          _$ShoppingItemCategorySuggestionImpl>
      get copyWith => __$$ShoppingItemCategorySuggestionImplCopyWithImpl<
          _$ShoppingItemCategorySuggestionImpl>(this, _$identity);
}

abstract class _ShoppingItemCategorySuggestion
    extends ShoppingCategorySuggestion {
  const factory _ShoppingItemCategorySuggestion(
          {required final String name,
          required final ShoppingCategorySuggestionSource source}) =
      _$ShoppingItemCategorySuggestionImpl;
  const _ShoppingItemCategorySuggestion._() : super._();

  @override
  String get name;
  @override
  ShoppingCategorySuggestionSource get source;

  /// Create a copy of ShoppingCategorySuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemCategorySuggestionImplCopyWith<
          _$ShoppingItemCategorySuggestionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
