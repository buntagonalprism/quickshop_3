// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_category_autocomplete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingCategoryAutocomplete {

 String get name; ShoppingCategoryAutocompleteSource get source; String get sourceId;
/// Create a copy of ShoppingCategoryAutocomplete
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingCategoryAutocompleteCopyWith<ShoppingCategoryAutocomplete> get copyWith => _$ShoppingCategoryAutocompleteCopyWithImpl<ShoppingCategoryAutocomplete>(this as ShoppingCategoryAutocomplete, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingCategoryAutocomplete&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}


@override
int get hashCode => Object.hash(runtimeType,name,source,sourceId);

@override
String toString() {
  return 'ShoppingCategoryAutocomplete(name: $name, source: $source, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class $ShoppingCategoryAutocompleteCopyWith<$Res>  {
  factory $ShoppingCategoryAutocompleteCopyWith(ShoppingCategoryAutocomplete value, $Res Function(ShoppingCategoryAutocomplete) _then) = _$ShoppingCategoryAutocompleteCopyWithImpl;
@useResult
$Res call({
 String name, ShoppingCategoryAutocompleteSource source, String sourceId
});




}
/// @nodoc
class _$ShoppingCategoryAutocompleteCopyWithImpl<$Res>
    implements $ShoppingCategoryAutocompleteCopyWith<$Res> {
  _$ShoppingCategoryAutocompleteCopyWithImpl(this._self, this._then);

  final ShoppingCategoryAutocomplete _self;
  final $Res Function(ShoppingCategoryAutocomplete) _then;

/// Create a copy of ShoppingCategoryAutocomplete
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? source = null,Object? sourceId = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ShoppingCategoryAutocompleteSource,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingCategoryAutocomplete].
extension ShoppingCategoryAutocompletePatterns on ShoppingCategoryAutocomplete {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingCategoryAutocomplete value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingCategoryAutocomplete value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingCategoryAutocomplete value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  ShoppingCategoryAutocompleteSource source,  String sourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete() when $default != null:
return $default(_that.name,_that.source,_that.sourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  ShoppingCategoryAutocompleteSource source,  String sourceId)  $default,) {final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete():
return $default(_that.name,_that.source,_that.sourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  ShoppingCategoryAutocompleteSource source,  String sourceId)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingCategoryAutocomplete() when $default != null:
return $default(_that.name,_that.source,_that.sourceId);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingCategoryAutocomplete extends ShoppingCategoryAutocomplete {
  const _ShoppingCategoryAutocomplete({required this.name, required this.source, required this.sourceId}): super._();
  

@override final  String name;
@override final  ShoppingCategoryAutocompleteSource source;
@override final  String sourceId;

/// Create a copy of ShoppingCategoryAutocomplete
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingCategoryAutocompleteCopyWith<_ShoppingCategoryAutocomplete> get copyWith => __$ShoppingCategoryAutocompleteCopyWithImpl<_ShoppingCategoryAutocomplete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingCategoryAutocomplete&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId));
}


@override
int get hashCode => Object.hash(runtimeType,name,source,sourceId);

@override
String toString() {
  return 'ShoppingCategoryAutocomplete(name: $name, source: $source, sourceId: $sourceId)';
}


}

/// @nodoc
abstract mixin class _$ShoppingCategoryAutocompleteCopyWith<$Res> implements $ShoppingCategoryAutocompleteCopyWith<$Res> {
  factory _$ShoppingCategoryAutocompleteCopyWith(_ShoppingCategoryAutocomplete value, $Res Function(_ShoppingCategoryAutocomplete) _then) = __$ShoppingCategoryAutocompleteCopyWithImpl;
@override @useResult
$Res call({
 String name, ShoppingCategoryAutocompleteSource source, String sourceId
});




}
/// @nodoc
class __$ShoppingCategoryAutocompleteCopyWithImpl<$Res>
    implements _$ShoppingCategoryAutocompleteCopyWith<$Res> {
  __$ShoppingCategoryAutocompleteCopyWithImpl(this._self, this._then);

  final _ShoppingCategoryAutocomplete _self;
  final $Res Function(_ShoppingCategoryAutocomplete) _then;

/// Create a copy of ShoppingCategoryAutocomplete
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? source = null,Object? sourceId = null,}) {
  return _then(_ShoppingCategoryAutocomplete(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ShoppingCategoryAutocompleteSource,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
