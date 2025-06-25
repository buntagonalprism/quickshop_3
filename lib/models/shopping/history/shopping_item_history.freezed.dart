// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemHistory {
  String get id => throw _privateConstructorUsedError;
  String get product => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  DateTime get lastUsed => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingItemHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingItemHistoryCopyWith<ShoppingItemHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemHistoryCopyWith<$Res> {
  factory $ShoppingItemHistoryCopyWith(
          ShoppingItemHistory value, $Res Function(ShoppingItemHistory) then) =
      _$ShoppingItemHistoryCopyWithImpl<$Res, ShoppingItemHistory>;
  @useResult
  $Res call(
      {String id,
      String product,
      List<String> categories,
      DateTime lastUsed,
      int usageCount});
}

/// @nodoc
class _$ShoppingItemHistoryCopyWithImpl<$Res, $Val extends ShoppingItemHistory>
    implements $ShoppingItemHistoryCopyWith<$Res> {
  _$ShoppingItemHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingItemHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? categories = null,
    Object? lastUsed = null,
    Object? usageCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemHistoryImplCopyWith<$Res>
    implements $ShoppingItemHistoryCopyWith<$Res> {
  factory _$$ShoppingItemHistoryImplCopyWith(_$ShoppingItemHistoryImpl value,
          $Res Function(_$ShoppingItemHistoryImpl) then) =
      __$$ShoppingItemHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String product,
      List<String> categories,
      DateTime lastUsed,
      int usageCount});
}

/// @nodoc
class __$$ShoppingItemHistoryImplCopyWithImpl<$Res>
    extends _$ShoppingItemHistoryCopyWithImpl<$Res, _$ShoppingItemHistoryImpl>
    implements _$$ShoppingItemHistoryImplCopyWith<$Res> {
  __$$ShoppingItemHistoryImplCopyWithImpl(_$ShoppingItemHistoryImpl _value,
      $Res Function(_$ShoppingItemHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingItemHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = null,
    Object? categories = null,
    Object? lastUsed = null,
    Object? usageCount = null,
  }) {
    return _then(_$ShoppingItemHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShoppingItemHistoryImpl extends _ShoppingItemHistory {
  const _$ShoppingItemHistoryImpl(
      {required this.id,
      required this.product,
      required final List<String> categories,
      required this.lastUsed,
      required this.usageCount})
      : _categories = categories,
        super._();

  @override
  final String id;
  @override
  final String product;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final DateTime lastUsed;
  @override
  final int usageCount;

  @override
  String toString() {
    return 'ShoppingItemHistory(id: $id, product: $product, categories: $categories, lastUsed: $lastUsed, usageCount: $usageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, product,
      const DeepCollectionEquality().hash(_categories), lastUsed, usageCount);

  /// Create a copy of ShoppingItemHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemHistoryImplCopyWith<_$ShoppingItemHistoryImpl> get copyWith =>
      __$$ShoppingItemHistoryImplCopyWithImpl<_$ShoppingItemHistoryImpl>(
          this, _$identity);
}

abstract class _ShoppingItemHistory extends ShoppingItemHistory {
  const factory _ShoppingItemHistory(
      {required final String id,
      required final String product,
      required final List<String> categories,
      required final DateTime lastUsed,
      required final int usageCount}) = _$ShoppingItemHistoryImpl;
  const _ShoppingItemHistory._() : super._();

  @override
  String get id;
  @override
  String get product;
  @override
  List<String> get categories;
  @override
  DateTime get lastUsed;
  @override
  int get usageCount;

  /// Create a copy of ShoppingItemHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingItemHistoryImplCopyWith<_$ShoppingItemHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
