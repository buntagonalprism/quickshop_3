// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_autocomplete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemAutocomplete {
  String get product => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  ShoppingItemAutocompleteSource get source =>
      throw _privateConstructorUsedError;
  String get sourceId => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemAutocompleteCopyWith<ShoppingItemAutocomplete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemAutocompleteCopyWith<$Res> {
  factory $ShoppingItemAutocompleteCopyWith(ShoppingItemAutocomplete value,
          $Res Function(ShoppingItemAutocomplete) then) =
      _$ShoppingItemAutocompleteCopyWithImpl<$Res, ShoppingItemAutocomplete>;
  @useResult
  $Res call(
      {String product,
      String quantity,
      List<String> categories,
      ShoppingItemAutocompleteSource source,
      String sourceId});
}

/// @nodoc
class _$ShoppingItemAutocompleteCopyWithImpl<$Res,
        $Val extends ShoppingItemAutocomplete>
    implements $ShoppingItemAutocompleteCopyWith<$Res> {
  _$ShoppingItemAutocompleteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? categories = null,
    Object? source = null,
    Object? sourceId = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingItemAutocompleteSource,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemAutocompleteImplCopyWith<$Res>
    implements $ShoppingItemAutocompleteCopyWith<$Res> {
  factory _$$ShoppingItemAutocompleteImplCopyWith(
          _$ShoppingItemAutocompleteImpl value,
          $Res Function(_$ShoppingItemAutocompleteImpl) then) =
      __$$ShoppingItemAutocompleteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String product,
      String quantity,
      List<String> categories,
      ShoppingItemAutocompleteSource source,
      String sourceId});
}

/// @nodoc
class __$$ShoppingItemAutocompleteImplCopyWithImpl<$Res>
    extends _$ShoppingItemAutocompleteCopyWithImpl<$Res,
        _$ShoppingItemAutocompleteImpl>
    implements _$$ShoppingItemAutocompleteImplCopyWith<$Res> {
  __$$ShoppingItemAutocompleteImplCopyWithImpl(
      _$ShoppingItemAutocompleteImpl _value,
      $Res Function(_$ShoppingItemAutocompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? categories = null,
    Object? source = null,
    Object? sourceId = null,
  }) {
    return _then(_$ShoppingItemAutocompleteImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as ShoppingItemAutocompleteSource,
      sourceId: null == sourceId
          ? _value.sourceId
          : sourceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShoppingItemAutocompleteImpl extends _ShoppingItemAutocomplete {
  const _$ShoppingItemAutocompleteImpl(
      {required this.product,
      required this.quantity,
      required final List<String> categories,
      required this.source,
      required this.sourceId})
      : _categories = categories,
        super._();

  @override
  final String product;
  @override
  final String quantity;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final ShoppingItemAutocompleteSource source;
  @override
  final String sourceId;

  @override
  String toString() {
    return 'ShoppingItemAutocomplete(product: $product, quantity: $quantity, categories: $categories, source: $source, sourceId: $sourceId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemAutocompleteImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.sourceId, sourceId) ||
                other.sourceId == sourceId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity,
      const DeepCollectionEquality().hash(_categories), source, sourceId);

  /// Create a copy of ShoppingItemAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemAutocompleteImplCopyWith<_$ShoppingItemAutocompleteImpl>
      get copyWith => __$$ShoppingItemAutocompleteImplCopyWithImpl<
          _$ShoppingItemAutocompleteImpl>(this, _$identity);
}

abstract class _ShoppingItemAutocomplete extends ShoppingItemAutocomplete {
  const factory _ShoppingItemAutocomplete(
      {required final String product,
      required final String quantity,
      required final List<String> categories,
      required final ShoppingItemAutocompleteSource source,
      required final String sourceId}) = _$ShoppingItemAutocompleteImpl;
  const _ShoppingItemAutocomplete._() : super._();

  @override
  String get product;
  @override
  String get quantity;
  @override
  List<String> get categories;
  @override
  ShoppingItemAutocompleteSource get source;
  @override
  String get sourceId;

  /// Create a copy of ShoppingItemAutocomplete
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemAutocompleteImplCopyWith<_$ShoppingItemAutocompleteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
