// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_place_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GooglePlaceResult {

 String get placeId; String get name; String get address;
/// Create a copy of GooglePlaceResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GooglePlaceResultCopyWith<GooglePlaceResult> get copyWith => _$GooglePlaceResultCopyWithImpl<GooglePlaceResult>(this as GooglePlaceResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GooglePlaceResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,name,address);

@override
String toString() {
  return 'GooglePlaceResult(placeId: $placeId, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class $GooglePlaceResultCopyWith<$Res>  {
  factory $GooglePlaceResultCopyWith(GooglePlaceResult value, $Res Function(GooglePlaceResult) _then) = _$GooglePlaceResultCopyWithImpl;
@useResult
$Res call({
 String placeId, String name, String address
});




}
/// @nodoc
class _$GooglePlaceResultCopyWithImpl<$Res>
    implements $GooglePlaceResultCopyWith<$Res> {
  _$GooglePlaceResultCopyWithImpl(this._self, this._then);

  final GooglePlaceResult _self;
  final $Res Function(GooglePlaceResult) _then;

/// Create a copy of GooglePlaceResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? name = null,Object? address = null,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GooglePlaceResult].
extension GooglePlaceResultPatterns on GooglePlaceResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GooglePlaceResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GooglePlaceResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GooglePlaceResult value)  $default,){
final _that = this;
switch (_that) {
case _GooglePlaceResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GooglePlaceResult value)?  $default,){
final _that = this;
switch (_that) {
case _GooglePlaceResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String name,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GooglePlaceResult() when $default != null:
return $default(_that.placeId,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String name,  String address)  $default,) {final _that = this;
switch (_that) {
case _GooglePlaceResult():
return $default(_that.placeId,_that.name,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String name,  String address)?  $default,) {final _that = this;
switch (_that) {
case _GooglePlaceResult() when $default != null:
return $default(_that.placeId,_that.name,_that.address);case _:
  return null;

}
}

}

/// @nodoc


class _GooglePlaceResult implements GooglePlaceResult {
  const _GooglePlaceResult({required this.placeId, required this.name, required this.address});
  

@override final  String placeId;
@override final  String name;
@override final  String address;

/// Create a copy of GooglePlaceResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GooglePlaceResultCopyWith<_GooglePlaceResult> get copyWith => __$GooglePlaceResultCopyWithImpl<_GooglePlaceResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GooglePlaceResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode => Object.hash(runtimeType,placeId,name,address);

@override
String toString() {
  return 'GooglePlaceResult(placeId: $placeId, name: $name, address: $address)';
}


}

/// @nodoc
abstract mixin class _$GooglePlaceResultCopyWith<$Res> implements $GooglePlaceResultCopyWith<$Res> {
  factory _$GooglePlaceResultCopyWith(_GooglePlaceResult value, $Res Function(_GooglePlaceResult) _then) = __$GooglePlaceResultCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String name, String address
});




}
/// @nodoc
class __$GooglePlaceResultCopyWithImpl<$Res>
    implements _$GooglePlaceResultCopyWith<$Res> {
  __$GooglePlaceResultCopyWithImpl(this._self, this._then);

  final _GooglePlaceResult _self;
  final $Res Function(_GooglePlaceResult) _then;

/// Create a copy of GooglePlaceResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? name = null,Object? address = null,}) {
  return _then(_GooglePlaceResult(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
