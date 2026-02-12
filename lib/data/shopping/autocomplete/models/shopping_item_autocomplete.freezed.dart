// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_autocomplete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingItemAutocomplete {

 String get product; String get quantity; String get category; ShoppingItemAutocompleteSource get source; String get sourceId;
/// Create a copy of ShoppingItemAutocomplete
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingItemAutocompleteCopyWith<ShoppingItemAutocomplete> get copyWith => _$ShoppingItemAutocompleteCopyWithImpl<ShoppingItemAutocomplete>(this as ShoppingItemAutocomplete, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingItemAutocomplete&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,category,source,sourceId);

@override
String toString() {
  return 'ShoppingItemAutocomplete(product: $product, quantity: $quantity, category: $category, source: $source, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class $ShoppingItemAutocompleteCopyWith<$Res>  {
  factory $ShoppingItemAutocompleteCopyWith(ShoppingItemAutocomplete value, $Res Function(ShoppingItemAutocomplete) _then) = _$ShoppingItemAutocompleteCopyWithImpl;
@useResult
$Res call({
 String product, String quantity, String category, ShoppingItemAutocompleteSource source, String sourceId
});




}
/// @nodoc
class _$ShoppingItemAutocompleteCopyWithImpl<$Res>
    implements $ShoppingItemAutocompleteCopyWith<$Res> {
  _$ShoppingItemAutocompleteCopyWithImpl(this._self, this._then);

  final ShoppingItemAutocomplete _self;
  final $Res Function(ShoppingItemAutocomplete) _then;

/// Create a copy of ShoppingItemAutocomplete
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? quantity = null,Object? category = null,Object? source = null,Object? sourceId = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ShoppingItemAutocompleteSource,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingItemAutocomplete].
extension ShoppingItemAutocompletePatterns on ShoppingItemAutocomplete {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingItemAutocomplete value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingItemAutocomplete value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingItemAutocomplete value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String product,  String quantity,  String category,  ShoppingItemAutocompleteSource source,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete() when $default != null:
return $default(_that.product,_that.quantity,_that.category,_that.source,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String product,  String quantity,  String category,  ShoppingItemAutocompleteSource source,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete():
return $default(_that.product,_that.quantity,_that.category,_that.source,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String product,  String quantity,  String category,  ShoppingItemAutocompleteSource source,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingItemAutocomplete() when $default != null:
return $default(_that.product,_that.quantity,_that.category,_that.source,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingItemAutocomplete extends ShoppingItemAutocomplete {
  const _ShoppingItemAutocomplete({required this.product, required this.quantity, required this.category, required this.source, required this.sourceId}): super._();
  

@override final  String product;
@override final  String quantity;
@override final  String category;
@override final  ShoppingItemAutocompleteSource source;
@override final  String sourceId;

/// Create a copy of ShoppingItemAutocomplete
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingItemAutocompleteCopyWith<_ShoppingItemAutocomplete> get copyWith => __$ShoppingItemAutocompleteCopyWithImpl<_ShoppingItemAutocomplete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingItemAutocomplete&&(identical(other.product, product) || other.product == product)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}


@override
int get hashCode => Object.hash(runtimeType,product,quantity,category,source,sourceId);

@override
String toString() {
  return 'ShoppingItemAutocomplete(product: $product, quantity: $quantity, category: $category, source: $source, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$ShoppingItemAutocompleteCopyWith<$Res> implements $ShoppingItemAutocompleteCopyWith<$Res> {
  factory _$ShoppingItemAutocompleteCopyWith(_ShoppingItemAutocomplete value, $Res Function(_ShoppingItemAutocomplete) _then) = __$ShoppingItemAutocompleteCopyWithImpl;
@override @useResult
$Res call({
 String product, String quantity, String category, ShoppingItemAutocompleteSource source, String sourceId
});




}
/// @nodoc
class __$ShoppingItemAutocompleteCopyWithImpl<$Res>
    implements _$ShoppingItemAutocompleteCopyWith<$Res> {
  __$ShoppingItemAutocompleteCopyWithImpl(this._self, this._then);

  final _ShoppingItemAutocomplete _self;
  final $Res Function(_ShoppingItemAutocomplete) _then;

/// Create a copy of ShoppingItemAutocomplete
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? quantity = null,Object? category = null,Object? source = null,Object? sourceId = null,}) {
  return _then(_ShoppingItemAutocomplete(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ShoppingItemAutocompleteSource,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
