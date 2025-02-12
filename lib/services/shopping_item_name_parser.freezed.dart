// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_name_parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ParsedShoppingItem {
  String get product => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;

  /// Create a copy of ParsedShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParsedShoppingItemCopyWith<ParsedShoppingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParsedShoppingItemCopyWith<$Res> {
  factory $ParsedShoppingItemCopyWith(
          ParsedShoppingItem value, $Res Function(ParsedShoppingItem) then) =
      _$ParsedShoppingItemCopyWithImpl<$Res, ParsedShoppingItem>;
  @useResult
  $Res call({String product, String quantity});
}

/// @nodoc
class _$ParsedShoppingItemCopyWithImpl<$Res, $Val extends ParsedShoppingItem>
    implements $ParsedShoppingItemCopyWith<$Res> {
  _$ParsedShoppingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParsedShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParsedShoppingItemImplCopyWith<$Res>
    implements $ParsedShoppingItemCopyWith<$Res> {
  factory _$$ParsedShoppingItemImplCopyWith(_$ParsedShoppingItemImpl value,
          $Res Function(_$ParsedShoppingItemImpl) then) =
      __$$ParsedShoppingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String product, String quantity});
}

/// @nodoc
class __$$ParsedShoppingItemImplCopyWithImpl<$Res>
    extends _$ParsedShoppingItemCopyWithImpl<$Res, _$ParsedShoppingItemImpl>
    implements _$$ParsedShoppingItemImplCopyWith<$Res> {
  __$$ParsedShoppingItemImplCopyWithImpl(_$ParsedShoppingItemImpl _value,
      $Res Function(_$ParsedShoppingItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ParsedShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$ParsedShoppingItemImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ParsedShoppingItemImpl extends _ParsedShoppingItem {
  const _$ParsedShoppingItemImpl(
      {required this.product, required this.quantity})
      : super._();

  @override
  final String product;
  @override
  final String quantity;

  @override
  String toString() {
    return 'ParsedShoppingItem(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParsedShoppingItemImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of ParsedShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParsedShoppingItemImplCopyWith<_$ParsedShoppingItemImpl> get copyWith =>
      __$$ParsedShoppingItemImplCopyWithImpl<_$ParsedShoppingItemImpl>(
          this, _$identity);
}

abstract class _ParsedShoppingItem extends ParsedShoppingItem {
  const factory _ParsedShoppingItem(
      {required final String product,
      required final String quantity}) = _$ParsedShoppingItemImpl;
  const _ParsedShoppingItem._() : super._();

  @override
  String get product;
  @override
  String get quantity;

  /// Create a copy of ParsedShoppingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParsedShoppingItemImplCopyWith<_$ParsedShoppingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
