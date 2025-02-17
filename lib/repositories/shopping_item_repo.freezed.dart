// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddItemResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) success,
    required TResult Function() categoryRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? success,
    TResult? Function()? categoryRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? success,
    TResult Function()? categoryRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItemResultSuccess value) success,
    required TResult Function(_AddItemResultCategoryRequired value)
        categoryRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItemResultSuccess value)? success,
    TResult? Function(_AddItemResultCategoryRequired value)? categoryRequired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItemResultSuccess value)? success,
    TResult Function(_AddItemResultCategoryRequired value)? categoryRequired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemResultCopyWith<$Res> {
  factory $AddItemResultCopyWith(
          AddItemResult value, $Res Function(AddItemResult) then) =
      _$AddItemResultCopyWithImpl<$Res, AddItemResult>;
}

/// @nodoc
class _$AddItemResultCopyWithImpl<$Res, $Val extends AddItemResult>
    implements $AddItemResultCopyWith<$Res> {
  _$AddItemResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddItemResultSuccessImplCopyWith<$Res> {
  factory _$$AddItemResultSuccessImplCopyWith(_$AddItemResultSuccessImpl value,
          $Res Function(_$AddItemResultSuccessImpl) then) =
      __$$AddItemResultSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ShoppingItem item});

  $ShoppingItemCopyWith<$Res> get item;
}

/// @nodoc
class __$$AddItemResultSuccessImplCopyWithImpl<$Res>
    extends _$AddItemResultCopyWithImpl<$Res, _$AddItemResultSuccessImpl>
    implements _$$AddItemResultSuccessImplCopyWith<$Res> {
  __$$AddItemResultSuccessImplCopyWithImpl(_$AddItemResultSuccessImpl _value,
      $Res Function(_$AddItemResultSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$AddItemResultSuccessImpl(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ShoppingItem,
    ));
  }

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingItemCopyWith<$Res> get item {
    return $ShoppingItemCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value));
    });
  }
}

/// @nodoc

class _$AddItemResultSuccessImpl extends _AddItemResultSuccess {
  const _$AddItemResultSuccessImpl(this.item) : super._();

  @override
  final ShoppingItem item;

  @override
  String toString() {
    return 'AddItemResult.success(item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemResultSuccessImpl &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemResultSuccessImplCopyWith<_$AddItemResultSuccessImpl>
      get copyWith =>
          __$$AddItemResultSuccessImplCopyWithImpl<_$AddItemResultSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) success,
    required TResult Function() categoryRequired,
  }) {
    return success(item);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? success,
    TResult? Function()? categoryRequired,
  }) {
    return success?.call(item);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? success,
    TResult Function()? categoryRequired,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(item);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItemResultSuccess value) success,
    required TResult Function(_AddItemResultCategoryRequired value)
        categoryRequired,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItemResultSuccess value)? success,
    TResult? Function(_AddItemResultCategoryRequired value)? categoryRequired,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItemResultSuccess value)? success,
    TResult Function(_AddItemResultCategoryRequired value)? categoryRequired,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _AddItemResultSuccess extends AddItemResult {
  const factory _AddItemResultSuccess(final ShoppingItem item) =
      _$AddItemResultSuccessImpl;
  const _AddItemResultSuccess._() : super._();

  ShoppingItem get item;

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddItemResultSuccessImplCopyWith<_$AddItemResultSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemResultCategoryRequiredImplCopyWith<$Res> {
  factory _$$AddItemResultCategoryRequiredImplCopyWith(
          _$AddItemResultCategoryRequiredImpl value,
          $Res Function(_$AddItemResultCategoryRequiredImpl) then) =
      __$$AddItemResultCategoryRequiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddItemResultCategoryRequiredImplCopyWithImpl<$Res>
    extends _$AddItemResultCopyWithImpl<$Res,
        _$AddItemResultCategoryRequiredImpl>
    implements _$$AddItemResultCategoryRequiredImplCopyWith<$Res> {
  __$$AddItemResultCategoryRequiredImplCopyWithImpl(
      _$AddItemResultCategoryRequiredImpl _value,
      $Res Function(_$AddItemResultCategoryRequiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddItemResultCategoryRequiredImpl
    extends _AddItemResultCategoryRequired {
  const _$AddItemResultCategoryRequiredImpl() : super._();

  @override
  String toString() {
    return 'AddItemResult.categoryRequired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemResultCategoryRequiredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) success,
    required TResult Function() categoryRequired,
  }) {
    return categoryRequired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? success,
    TResult? Function()? categoryRequired,
  }) {
    return categoryRequired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? success,
    TResult Function()? categoryRequired,
    required TResult orElse(),
  }) {
    if (categoryRequired != null) {
      return categoryRequired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItemResultSuccess value) success,
    required TResult Function(_AddItemResultCategoryRequired value)
        categoryRequired,
  }) {
    return categoryRequired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItemResultSuccess value)? success,
    TResult? Function(_AddItemResultCategoryRequired value)? categoryRequired,
  }) {
    return categoryRequired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItemResultSuccess value)? success,
    TResult Function(_AddItemResultCategoryRequired value)? categoryRequired,
    required TResult orElse(),
  }) {
    if (categoryRequired != null) {
      return categoryRequired(this);
    }
    return orElse();
  }
}

abstract class _AddItemResultCategoryRequired extends AddItemResult {
  const factory _AddItemResultCategoryRequired() =
      _$AddItemResultCategoryRequiredImpl;
  const _AddItemResultCategoryRequired._() : super._();
}
