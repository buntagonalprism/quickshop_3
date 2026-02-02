// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_raw_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemRawData {

 String get product; String get quantity; String get category;
/// Create a copy of ShoppingItemRawData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemRawDataCopyWith<ShoppingItemRawData> get copyWith => _$ShoppingItemRawDataCopyWithImpl<ShoppingItemRawData>(this as ShoppingItemRawData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemRawData&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,category);

@override
String toString() {
  return 'ShoppingItemRawData(product: $product, quantity: $quantity, category: $category)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemRawDataCopyWith<$Res>  {
  factory $ShoppingItemRawDataCopyWith(ShoppingItemRawData value, $Res Function(ShoppingItemRawData) _then) = _$ShoppingItemRawDataCopyWithImpl;
@useResult
$Res call({
 String product, String quantity, String category
});




}
/// @nodoc
class _$ShoppingItemRawDataCopyWithImpl<$Res>
    implements $ShoppingItemRawDataCopyWith<$Res> {
  _$ShoppingItemRawDataCopyWithImpl(this._self, this._then);

  final ShoppingItemRawData _self;
  final $Res Function(ShoppingItemRawData) _then;

/// Create a copy of ShoppingItemRawData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,Object? category = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemRawData].
extension ShoppingItemRawDataPatterns on ShoppingItemRawData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemRawData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemRawData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemRawData value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemRawData():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemRawData value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemRawData() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String product,  String quantity,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemRawData() when $default != null:
return $default(_that.product,_that.quantity,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String product,  String quantity,  String category)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemRawData():
return $default(_that.product,_that.quantity,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String product,  String quantity,  String category)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemRawData() when $default != null:
return $default(_that.product,_that.quantity,_that.category);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemRawData extends ShoppingItemRawData {
   _ShoppingItemRawData({required this.product, required this.quantity, required this.category}): super._();
  

@override final  String product;
@override final  String quantity;
@override final  String category;

/// Create a copy of ShoppingItemRawData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemRawDataCopyWith<_ShoppingItemRawData> get copyWith => __$ShoppingItemRawDataCopyWithImpl<_ShoppingItemRawData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemRawData&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,category);

@override
String toString() {
  return 'ShoppingItemRawData(product: $product, quantity: $quantity, category: $category)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemRawDataCopyWith<$Res> implements $ShoppingItemRawDataCopyWith<$Res> {
  factory _$ShoppingItemRawDataCopyWith(_ShoppingItemRawData value, $Res Function(_ShoppingItemRawData) _then) = __$ShoppingItemRawDataCopyWithImpl;
@override @useResult
$Res call({
 String product, String quantity, String category
});




}
/// @nodoc
class __$ShoppingItemRawDataCopyWithImpl<$Res>
    implements _$ShoppingItemRawDataCopyWith<$Res> {
  __$ShoppingItemRawDataCopyWithImpl(this._self, this._then);

  final _ShoppingItemRawData _self;
  final $Res Function(_ShoppingItemRawData) _then;

/// Create a copy of ShoppingItemRawData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,Object? category = null,}) {
  return _then(_ShoppingItemRawData(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
