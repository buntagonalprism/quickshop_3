// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_repo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddItemResult {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddItemResult);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddItemResult()';
  }
}

/// @nodoc
class $AddItemResultCopyWith<$Res> {
  $AddItemResultCopyWith(AddItemResult _, $Res Function(AddItemResult) __);
}

/// Adds pattern-matching-related methods to [AddItemResult].
extension AddItemResultPatterns on AddItemResult {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddItemResultSuccess value)? success,
    TResult Function(_AddItemResultCategoryRequired value)? categoryRequired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess() when success != null:
        return success(_that);
      case _AddItemResultCategoryRequired() when categoryRequired != null:
        return categoryRequired(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_AddItemResultSuccess value) success,
    required TResult Function(_AddItemResultCategoryRequired value)
        categoryRequired,
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess():
        return success(_that);
      case _AddItemResultCategoryRequired():
        return categoryRequired(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddItemResultSuccess value)? success,
    TResult? Function(_AddItemResultCategoryRequired value)? categoryRequired,
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess() when success != null:
        return success(_that);
      case _AddItemResultCategoryRequired() when categoryRequired != null:
        return categoryRequired(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ShoppingItem item)? success,
    TResult Function()? categoryRequired,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess() when success != null:
        return success(_that.item);
      case _AddItemResultCategoryRequired() when categoryRequired != null:
        return categoryRequired();
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
  TResult when<TResult extends Object?>({
    required TResult Function(ShoppingItem item) success,
    required TResult Function() categoryRequired,
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess():
        return success(_that.item);
      case _AddItemResultCategoryRequired():
        return categoryRequired();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ShoppingItem item)? success,
    TResult? Function()? categoryRequired,
  }) {
    final _that = this;
    switch (_that) {
      case _AddItemResultSuccess() when success != null:
        return success(_that.item);
      case _AddItemResultCategoryRequired() when categoryRequired != null:
        return categoryRequired();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddItemResultSuccess extends AddItemResult {
  const _AddItemResultSuccess(this.item) : super._();

  final ShoppingItem item;

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddItemResultSuccessCopyWith<_AddItemResultSuccess> get copyWith =>
      __$AddItemResultSuccessCopyWithImpl<_AddItemResultSuccess>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddItemResultSuccess &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @override
  String toString() {
    return 'AddItemResult.success(item: $item)';
  }
}

/// @nodoc
abstract mixin class _$AddItemResultSuccessCopyWith<$Res>
    implements $AddItemResultCopyWith<$Res> {
  factory _$AddItemResultSuccessCopyWith(_AddItemResultSuccess value,
          $Res Function(_AddItemResultSuccess) _then) =
      __$AddItemResultSuccessCopyWithImpl;
  @useResult
  $Res call({ShoppingItem item});

  $ShoppingItemCopyWith<$Res> get item;
}

/// @nodoc
class __$AddItemResultSuccessCopyWithImpl<$Res>
    implements _$AddItemResultSuccessCopyWith<$Res> {
  __$AddItemResultSuccessCopyWithImpl(this._self, this._then);

  final _AddItemResultSuccess _self;
  final $Res Function(_AddItemResultSuccess) _then;

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = null,
  }) {
    return _then(_AddItemResultSuccess(
      null == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as ShoppingItem,
    ));
  }

  /// Create a copy of AddItemResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShoppingItemCopyWith<$Res> get item {
    return $ShoppingItemCopyWith<$Res>(_self.item, (value) {
      return _then(_self.copyWith(item: value));
    });
  }
}

/// @nodoc

class _AddItemResultCategoryRequired extends AddItemResult {
  const _AddItemResultCategoryRequired() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddItemResultCategoryRequired);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddItemResult.categoryRequired()';
  }
}

// dart format on
