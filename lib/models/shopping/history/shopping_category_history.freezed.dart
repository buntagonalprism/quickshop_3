// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingCategoryHistory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;
  DateTime get lastUsed => throw _privateConstructorUsedError;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShoppingCategoryHistoryCopyWith<ShoppingCategoryHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingCategoryHistoryCopyWith<$Res> {
  factory $ShoppingCategoryHistoryCopyWith(ShoppingCategoryHistory value,
          $Res Function(ShoppingCategoryHistory) then) =
      _$ShoppingCategoryHistoryCopyWithImpl<$Res, ShoppingCategoryHistory>;
  @useResult
  $Res call({String id, String name, int usageCount, DateTime lastUsed});
}

/// @nodoc
class _$ShoppingCategoryHistoryCopyWithImpl<$Res,
        $Val extends ShoppingCategoryHistory>
    implements $ShoppingCategoryHistoryCopyWith<$Res> {
  _$ShoppingCategoryHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? usageCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingCategoryHistoryImplCopyWith<$Res>
    implements $ShoppingCategoryHistoryCopyWith<$Res> {
  factory _$$ShoppingCategoryHistoryImplCopyWith(
          _$ShoppingCategoryHistoryImpl value,
          $Res Function(_$ShoppingCategoryHistoryImpl) then) =
      __$$ShoppingCategoryHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, int usageCount, DateTime lastUsed});
}

/// @nodoc
class __$$ShoppingCategoryHistoryImplCopyWithImpl<$Res>
    extends _$ShoppingCategoryHistoryCopyWithImpl<$Res,
        _$ShoppingCategoryHistoryImpl>
    implements _$$ShoppingCategoryHistoryImplCopyWith<$Res> {
  __$$ShoppingCategoryHistoryImplCopyWithImpl(
      _$ShoppingCategoryHistoryImpl _value,
      $Res Function(_$ShoppingCategoryHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? usageCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_$ShoppingCategoryHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      usageCount: null == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ShoppingCategoryHistoryImpl extends _ShoppingCategoryHistory {
  const _$ShoppingCategoryHistoryImpl(
      {required this.id,
      required this.name,
      required this.usageCount,
      required this.lastUsed})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final int usageCount;
  @override
  final DateTime lastUsed;

  @override
  String toString() {
    return 'ShoppingCategoryHistory(id: $id, name: $name, usageCount: $usageCount, lastUsed: $lastUsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingCategoryHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, usageCount, lastUsed);

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingCategoryHistoryImplCopyWith<_$ShoppingCategoryHistoryImpl>
      get copyWith => __$$ShoppingCategoryHistoryImplCopyWithImpl<
          _$ShoppingCategoryHistoryImpl>(this, _$identity);
}

abstract class _ShoppingCategoryHistory extends ShoppingCategoryHistory {
  const factory _ShoppingCategoryHistory(
      {required final String id,
      required final String name,
      required final int usageCount,
      required final DateTime lastUsed}) = _$ShoppingCategoryHistoryImpl;
  const _ShoppingCategoryHistory._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  int get usageCount;
  @override
  DateTime get lastUsed;

  /// Create a copy of ShoppingCategoryHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShoppingCategoryHistoryImplCopyWith<_$ShoppingCategoryHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
