// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_autocomplete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCategoryAutocomplete {
  String get name => throw _privateConstructorUsedError;
  ShoppingCategoryAutocompleteSource get source =>
      throw _privateConstructorUsedError;
  String get sourceId => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingCategoryAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingCategoryAutocompleteCopyWith<ShoppingCategoryAutocomplete>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCategoryAutocompleteCopyWith<$Res> {
  factory $ShoppingCategoryAutocompleteCopyWith(
          ShoppingCategoryAutocomplete value,
          $Res Function(ShoppingCategoryAutocomplete) then) =
      _$ShoppingCategoryAutocompleteCopyWithImpl<$Res,
          ShoppingCategoryAutocomplete>;
  @useResult
  $Res call(
      {String name,
      ShoppingCategoryAutocompleteSource source,
      String sourceId});
}

/// @nodoc
class _$ShoppingCategoryAutocompleteCopyWithImpl<$Res,
        $Val extends ShoppingCategoryAutocomplete>
    implements $ShoppingCategoryAutocompleteCopyWith<$Res> {
  _$ShoppingCategoryAutocompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCategoryAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? source = null,
    Object? sourceId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingCategoryAutocompleteSource,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingCategoryAutocompleteImplCopyWith<$Res>
    implements $ShoppingCategoryAutocompleteCopyWith<$Res> {
  factory _$$ShoppingCategoryAutocompleteImplCopyWith(
          _$ShoppingCategoryAutocompleteImpl value,
          $Res Function(_$ShoppingCategoryAutocompleteImpl) then) =
      __$$ShoppingCategoryAutocompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      ShoppingCategoryAutocompleteSource source,
      String sourceId});
}

/// @nodoc
class __$$ShoppingCategoryAutocompleteImplCopyWithImpl<$Res>
    extends _$ShoppingCategoryAutocompleteCopyWithImpl<$Res,
        _$ShoppingCategoryAutocompleteImpl>
    implements _$$ShoppingCategoryAutocompleteImplCopyWith<$Res> {
  __$$ShoppingCategoryAutocompleteImplCopyWithImpl(
      _$ShoppingCategoryAutocompleteImpl _value,
      $Res Function(_$ShoppingCategoryAutocompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCategoryAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? source = null,
    Object? sourceId = null,
  }) {
    return _then(_$ShoppingCategoryAutocompleteImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingCategoryAutocompleteSource,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShoppingCategoryAutocompleteImpl extends _ShoppingCategoryAutocomplete {
  const _$ShoppingCategoryAutocompleteImpl(
      {required this.name, required this.source, required this.sourceId})
      : super._();

  @override
  final String name;
  @override
  final ShoppingCategoryAutocompleteSource source;
  @override
  final String sourceId;

  @override
  String toString() {
    return 'ShoppingCategoryAutocomplete(name: $name, source: $source, sourceId: $sourceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCategoryAutocompleteImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, source, sourceId);

  /// Create a copy of ShoppingCategoryAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCategoryAutocompleteImplCopyWith<
          _$ShoppingCategoryAutocompleteImpl>
      get copyWith => __$$ShoppingCategoryAutocompleteImplCopyWithImpl<
          _$ShoppingCategoryAutocompleteImpl>(this, _$identity);
}

abstract class _ShoppingCategoryAutocomplete
    extends ShoppingCategoryAutocomplete {
  const factory _ShoppingCategoryAutocomplete(
      {required final String name,
      required final ShoppingCategoryAutocompleteSource source,
      required final String sourceId}) = _$ShoppingCategoryAutocompleteImpl;
  const _ShoppingCategoryAutocomplete._() : super._();

  @override
  String get name;
  @override
  ShoppingCategoryAutocompleteSource get source;
  @override
  String get sourceId;

  /// Create a copy of ShoppingCategoryAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingCategoryAutocompleteImplCopyWith<
          _$ShoppingCategoryAutocompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
