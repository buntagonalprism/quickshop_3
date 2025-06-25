// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemSuggestion {
  String get product => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  ShoppingItemSuggestionSource get source => throw _privateConstructorUsedError;
  String? get listItemId => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemSuggestionCopyWith<ShoppingItemSuggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemSuggestionCopyWith<$Res> {
  factory $ShoppingItemSuggestionCopyWith(ShoppingItemSuggestion value,
          $Res Function(ShoppingItemSuggestion) then) =
      _$ShoppingItemSuggestionCopyWithImpl<$Res, ShoppingItemSuggestion>;
  @useResult
  $Res call(
      {String product,
      String quantity,
      List<String> categories,
      ShoppingItemSuggestionSource source,
      String? listItemId});
}

/// @nodoc
class _$ShoppingItemSuggestionCopyWithImpl<$Res,
        $Val extends ShoppingItemSuggestion>
    implements $ShoppingItemSuggestionCopyWith<$Res> {
  _$ShoppingItemSuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? categories = null,
    Object? source = null,
    Object? listItemId = freezed,
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
              as ShoppingItemSuggestionSource,
      listItemId: freezed == listItemId
          ? _value.listItemId
          : listItemId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemSuggestionImplCopyWith<$Res>
    implements $ShoppingItemSuggestionCopyWith<$Res> {
  factory _$$ShoppingItemSuggestionImplCopyWith(
          _$ShoppingItemSuggestionImpl value,
          $Res Function(_$ShoppingItemSuggestionImpl) then) =
      __$$ShoppingItemSuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String product,
      String quantity,
      List<String> categories,
      ShoppingItemSuggestionSource source,
      String? listItemId});
}

/// @nodoc
class __$$ShoppingItemSuggestionImplCopyWithImpl<$Res>
    extends _$ShoppingItemSuggestionCopyWithImpl<$Res,
        _$ShoppingItemSuggestionImpl>
    implements _$$ShoppingItemSuggestionImplCopyWith<$Res> {
  __$$ShoppingItemSuggestionImplCopyWithImpl(
      _$ShoppingItemSuggestionImpl _value,
      $Res Function(_$ShoppingItemSuggestionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
    Object? categories = null,
    Object? source = null,
    Object? listItemId = freezed,
  }) {
    return _then(_$ShoppingItemSuggestionImpl(
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
              as ShoppingItemSuggestionSource,
      listItemId: freezed == listItemId
          ? _value.listItemId
          : listItemId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ShoppingItemSuggestionImpl extends _ShoppingItemSuggestion {
  const _$ShoppingItemSuggestionImpl(
      {required this.product,
      required this.quantity,
      required final List<String> categories,
      required this.source,
      this.listItemId})
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
  final ShoppingItemSuggestionSource source;
  @override
  final String? listItemId;

  @override
  String toString() {
    return 'ShoppingItemSuggestion(product: $product, quantity: $quantity, categories: $categories, source: $source, listItemId: $listItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemSuggestionImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.listItemId, listItemId) ||
                other.listItemId == listItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity,
      const DeepCollectionEquality().hash(_categories), source, listItemId);

  /// Create a copy of ShoppingItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemSuggestionImplCopyWith<_$ShoppingItemSuggestionImpl>
      get copyWith => __$$ShoppingItemSuggestionImplCopyWithImpl<
          _$ShoppingItemSuggestionImpl>(this, _$identity);
}

abstract class _ShoppingItemSuggestion extends ShoppingItemSuggestion {
  const factory _ShoppingItemSuggestion(
      {required final String product,
      required final String quantity,
      required final List<String> categories,
      required final ShoppingItemSuggestionSource source,
      final String? listItemId}) = _$ShoppingItemSuggestionImpl;
  const _ShoppingItemSuggestion._() : super._();

  @override
  String get product;
  @override
  String get quantity;
  @override
  List<String> get categories;
  @override
  ShoppingItemSuggestionSource get source;
  @override
  String? get listItemId;

  /// Create a copy of ShoppingItemSuggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemSuggestionImplCopyWith<_$ShoppingItemSuggestionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
