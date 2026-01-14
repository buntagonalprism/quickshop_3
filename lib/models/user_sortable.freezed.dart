// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sortable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserSortKey {

 int get primary; String get secondary;
/// Create a copy of UserSortKey
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSortKeyCopyWith<UserSortKey> get copyWith => _$UserSortKeyCopyWithImpl<UserSortKey>(this as UserSortKey, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSortKey&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'UserSortKey(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class $UserSortKeyCopyWith<$Res>  {
  factory $UserSortKeyCopyWith(UserSortKey value, $Res Function(UserSortKey) _then) = _$UserSortKeyCopyWithImpl;
@useResult
$Res call({
 int primary, String secondary
});




}
/// @nodoc
class _$UserSortKeyCopyWithImpl<$Res>
    implements $UserSortKeyCopyWith<$Res> {
  _$UserSortKeyCopyWithImpl(this._self, this._then);

  final UserSortKey _self;
  final $Res Function(UserSortKey) _then;

/// Create a copy of UserSortKey
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_self.copyWith(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as int,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSortKey].
extension UserSortKeyPatterns on UserSortKey {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSortKey value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSortKey() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSortKey value)  $default,){
final _that = this;
switch (_that) {
case _UserSortKey():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSortKey value)?  $default,){
final _that = this;
switch (_that) {
case _UserSortKey() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int primary,  String secondary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSortKey() when $default != null:
return $default(_that.primary,_that.secondary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int primary,  String secondary)  $default,) {final _that = this;
switch (_that) {
case _UserSortKey():
return $default(_that.primary,_that.secondary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int primary,  String secondary)?  $default,) {final _that = this;
switch (_that) {
case _UserSortKey() when $default != null:
return $default(_that.primary,_that.secondary);case _:
  return null;

}
}

}

/// @nodoc


class _UserSortKey extends UserSortKey {
  const _UserSortKey({required this.primary, required this.secondary}): super._();
  

@override final  int primary;
@override final  String secondary;

/// Create a copy of UserSortKey
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSortKeyCopyWith<_UserSortKey> get copyWith => __$UserSortKeyCopyWithImpl<_UserSortKey>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSortKey&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.secondary, secondary) || other.secondary == secondary));
}


@override
int get hashCode => Object.hash(runtimeType,primary,secondary);

@override
String toString() {
  return 'UserSortKey(primary: $primary, secondary: $secondary)';
}


}

/// @nodoc
abstract mixin class _$UserSortKeyCopyWith<$Res> implements $UserSortKeyCopyWith<$Res> {
  factory _$UserSortKeyCopyWith(_UserSortKey value, $Res Function(_UserSortKey) _then) = __$UserSortKeyCopyWithImpl;
@override @useResult
$Res call({
 int primary, String secondary
});




}
/// @nodoc
class __$UserSortKeyCopyWithImpl<$Res>
    implements _$UserSortKeyCopyWith<$Res> {
  __$UserSortKeyCopyWithImpl(this._self, this._then);

  final _UserSortKey _self;
  final $Res Function(_UserSortKey) _then;

/// Create a copy of UserSortKey
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primary = null,Object? secondary = null,}) {
  return _then(_UserSortKey(
primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as int,secondary: null == secondary ? _self.secondary : secondary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
