// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShoppingItemCreateData {
  String get filter;
  String get product;
  String get quantity;
  List<String> get selectedCategories;

  /// Create a copy of ShoppingItemCreateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShoppingItemCreateDataCopyWith<ShoppingItemCreateData> get copyWith =>
      _$ShoppingItemCreateDataCopyWithImpl<ShoppingItemCreateData>(
          this as ShoppingItemCreateData, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShoppingItemCreateData &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other.selectedCategories, selectedCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, product, quantity,
      const DeepCollectionEquality().hash(selectedCategories));

  @override
  String toString() {
    return 'ShoppingItemCreateData(filter: $filter, product: $product, quantity: $quantity, selectedCategories: $selectedCategories)';
  }
}

/// @nodoc
abstract mixin class $ShoppingItemCreateDataCopyWith<$Res> {
  factory $ShoppingItemCreateDataCopyWith(ShoppingItemCreateData value,
          $Res Function(ShoppingItemCreateData) _then) =
      _$ShoppingItemCreateDataCopyWithImpl;
  @useResult
  $Res call(
      {String filter,
      String product,
      String quantity,
      List<String> selectedCategories});
}

/// @nodoc
class _$ShoppingItemCreateDataCopyWithImpl<$Res>
    implements $ShoppingItemCreateDataCopyWith<$Res> {
  _$ShoppingItemCreateDataCopyWithImpl(this._self, this._then);

  final ShoppingItemCreateData _self;
  final $Res Function(ShoppingItemCreateData) _then;

  /// Create a copy of ShoppingItemCreateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? product = null,
    Object? quantity = null,
    Object? selectedCategories = null,
  }) {
    return _then(_self.copyWith(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategories: null == selectedCategories
          ? _self.selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShoppingItemCreateData].
extension ShoppingItemCreateDataPatterns on ShoppingItemCreateData {
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
    TResult Function(_ShoppingItemCreateData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData() when $default != null:
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
    TResult Function(_ShoppingItemCreateData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData():
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
    TResult? Function(_ShoppingItemCreateData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData() when $default != null:
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
    TResult Function(String filter, String product, String quantity,
            List<String> selectedCategories)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData() when $default != null:
        return $default(_that.filter, _that.product, _that.quantity,
            _that.selectedCategories);
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
    TResult Function(String filter, String product, String quantity,
            List<String> selectedCategories)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData():
        return $default(_that.filter, _that.product, _that.quantity,
            _that.selectedCategories);
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
    TResult? Function(String filter, String product, String quantity,
            List<String> selectedCategories)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShoppingItemCreateData() when $default != null:
        return $default(_that.filter, _that.product, _that.quantity,
            _that.selectedCategories);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShoppingItemCreateData extends ShoppingItemCreateData {
  const _ShoppingItemCreateData(
      {required this.filter,
      required this.product,
      required this.quantity,
      required final List<String> selectedCategories})
      : _selectedCategories = selectedCategories,
        super._();

  @override
  final String filter;
  @override
  final String product;
  @override
  final String quantity;
  final List<String> _selectedCategories;
  @override
  List<String> get selectedCategories {
    if (_selectedCategories is EqualUnmodifiableListView)
      return _selectedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedCategories);
  }

  /// Create a copy of ShoppingItemCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShoppingItemCreateDataCopyWith<_ShoppingItemCreateData> get copyWith =>
      __$ShoppingItemCreateDataCopyWithImpl<_ShoppingItemCreateData>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShoppingItemCreateData &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            const DeepCollectionEquality()
                .equals(other._selectedCategories, _selectedCategories));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filter, product, quantity,
      const DeepCollectionEquality().hash(_selectedCategories));

  @override
  String toString() {
    return 'ShoppingItemCreateData(filter: $filter, product: $product, quantity: $quantity, selectedCategories: $selectedCategories)';
  }
}

/// @nodoc
abstract mixin class _$ShoppingItemCreateDataCopyWith<$Res>
    implements $ShoppingItemCreateDataCopyWith<$Res> {
  factory _$ShoppingItemCreateDataCopyWith(_ShoppingItemCreateData value,
          $Res Function(_ShoppingItemCreateData) _then) =
      __$ShoppingItemCreateDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String filter,
      String product,
      String quantity,
      List<String> selectedCategories});
}

/// @nodoc
class __$ShoppingItemCreateDataCopyWithImpl<$Res>
    implements _$ShoppingItemCreateDataCopyWith<$Res> {
  __$ShoppingItemCreateDataCopyWithImpl(this._self, this._then);

  final _ShoppingItemCreateData _self;
  final $Res Function(_ShoppingItemCreateData) _then;

  /// Create a copy of ShoppingItemCreateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filter = null,
    Object? product = null,
    Object? quantity = null,
    Object? selectedCategories = null,
  }) {
    return _then(_ShoppingItemCreateData(
      filter: null == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategories: null == selectedCategories
          ? _self._selectedCategories
          : selectedCategories // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
