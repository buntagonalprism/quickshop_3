// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_name_parser.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedShoppingItem {

 String get product; String get quantity;
/// Create a copy of ParsedShoppingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedShoppingItemCopyWith<ParsedShoppingItem> get copyWith => _$ParsedShoppingItemCopyWithImpl<ParsedShoppingItem>(this as ParsedShoppingItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedShoppingItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity);

@override
String toString() {
  return 'ParsedShoppingItem(product: $product, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ParsedShoppingItemCopyWith<$Res>  {
  factory $ParsedShoppingItemCopyWith(ParsedShoppingItem value, $Res Function(ParsedShoppingItem) _then) = _$ParsedShoppingItemCopyWithImpl;
@useResult
$Res call({
 String product, String quantity
});




}
/// @nodoc
class _$ParsedShoppingItemCopyWithImpl<$Res>
    implements $ParsedShoppingItemCopyWith<$Res> {
  _$ParsedShoppingItemCopyWithImpl(this._self, this._then);

  final ParsedShoppingItem _self;
  final $Res Function(ParsedShoppingItem) _then;

/// Create a copy of ParsedShoppingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedShoppingItem].
extension ParsedShoppingItemPatterns on ParsedShoppingItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedShoppingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedShoppingItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedShoppingItem value)  $default,){
final _that = this;
switch (_that) {
case _ParsedShoppingItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedShoppingItem value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedShoppingItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String product,  String quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedShoppingItem() when $default != null:
return $default(_that.product,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String product,  String quantity)  $default,) {final _that = this;
switch (_that) {
case _ParsedShoppingItem():
return $default(_that.product,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String product,  String quantity)?  $default,) {final _that = this;
switch (_that) {
case _ParsedShoppingItem() when $default != null:
return $default(_that.product,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedShoppingItem extends ParsedShoppingItem {
  const _ParsedShoppingItem({required this.product, required this.quantity}): super._();
  

@override final  String product;
@override final  String quantity;

/// Create a copy of ParsedShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedShoppingItemCopyWith<_ParsedShoppingItem> get copyWith => __$ParsedShoppingItemCopyWithImpl<_ParsedShoppingItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedShoppingItem&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity);

@override
String toString() {
  return 'ParsedShoppingItem(product: $product, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$ParsedShoppingItemCopyWith<$Res> implements $ParsedShoppingItemCopyWith<$Res> {
  factory _$ParsedShoppingItemCopyWith(_ParsedShoppingItem value, $Res Function(_ParsedShoppingItem) _then) = __$ParsedShoppingItemCopyWithImpl;
@override @useResult
$Res call({
 String product, String quantity
});




}
/// @nodoc
class __$ParsedShoppingItemCopyWithImpl<$Res>
    implements _$ParsedShoppingItemCopyWith<$Res> {
  __$ParsedShoppingItemCopyWithImpl(this._self, this._then);

  final _ParsedShoppingItem _self;
  final $Res Function(_ParsedShoppingItem) _then;

/// Create a copy of ParsedShoppingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,}) {
  return _then(_ParsedShoppingItem(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
