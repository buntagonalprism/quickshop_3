// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreLocation {

 String get id;/// Name of the store location, e.g. "Aisle 12", "Back wall", "Deli"
 String get name;/// The sort key tracks the order in which store locations should be
/// visited when the user is shopping in this store.
 UserSortKey get sortKey;/// Product categories which can be found in this store location
 List<String> get categories;
/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreLocationCopyWith<StoreLocation> get copyWith => _$StoreLocationCopyWithImpl<StoreLocation>(this as StoreLocation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortKey, sortKey) || other.sortKey == sortKey)&&const DeepCollectionEquality().equals(other.categories, categories));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,sortKey,const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'StoreLocation(id: $id, name: $name, sortKey: $sortKey, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $StoreLocationCopyWith<$Res>  {
  factory $StoreLocationCopyWith(StoreLocation value, $Res Function(StoreLocation) _then) = _$StoreLocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, UserSortKey sortKey, List<String> categories
});


$UserSortKeyCopyWith<$Res> get sortKey;

}
/// @nodoc
class _$StoreLocationCopyWithImpl<$Res>
    implements $StoreLocationCopyWith<$Res> {
  _$StoreLocationCopyWithImpl(this._self, this._then);

  final StoreLocation _self;
  final $Res Function(StoreLocation) _then;

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? sortKey = null,Object? categories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortKey: null == sortKey ? _self.sortKey : sortKey // ignore: cast_nullable_to_non_nullable
as UserSortKey,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSortKeyCopyWith<$Res> get sortKey {
  
  return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
    return _then(_self.copyWith(sortKey: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreLocation].
extension StoreLocationPatterns on StoreLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreLocation value)  $default,){
final _that = this;
switch (_that) {
case _StoreLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreLocation value)?  $default,){
final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  UserSortKey sortKey,  List<String> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that.id,_that.name,_that.sortKey,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  UserSortKey sortKey,  List<String> categories)  $default,) {final _that = this;
switch (_that) {
case _StoreLocation():
return $default(_that.id,_that.name,_that.sortKey,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  UserSortKey sortKey,  List<String> categories)?  $default,) {final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that.id,_that.name,_that.sortKey,_that.categories);case _:
  return null;

}
}

}

/// @nodoc


class _StoreLocation extends StoreLocation {
  const _StoreLocation({required this.id, required this.name, required this.sortKey, required final  List<String> categories}): _categories = categories,super._();
  

@override final  String id;
/// Name of the store location, e.g. "Aisle 12", "Back wall", "Deli"
@override final  String name;
/// The sort key tracks the order in which store locations should be
/// visited when the user is shopping in this store.
@override final  UserSortKey sortKey;
/// Product categories which can be found in this store location
 final  List<String> _categories;
/// Product categories which can be found in this store location
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreLocationCopyWith<_StoreLocation> get copyWith => __$StoreLocationCopyWithImpl<_StoreLocation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortKey, sortKey) || other.sortKey == sortKey)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,sortKey,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'StoreLocation(id: $id, name: $name, sortKey: $sortKey, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$StoreLocationCopyWith<$Res> implements $StoreLocationCopyWith<$Res> {
  factory _$StoreLocationCopyWith(_StoreLocation value, $Res Function(_StoreLocation) _then) = __$StoreLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, UserSortKey sortKey, List<String> categories
});


@override $UserSortKeyCopyWith<$Res> get sortKey;

}
/// @nodoc
class __$StoreLocationCopyWithImpl<$Res>
    implements _$StoreLocationCopyWith<$Res> {
  __$StoreLocationCopyWithImpl(this._self, this._then);

  final _StoreLocation _self;
  final $Res Function(_StoreLocation) _then;

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? sortKey = null,Object? categories = null,}) {
  return _then(_StoreLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortKey: null == sortKey ? _self.sortKey : sortKey // ignore: cast_nullable_to_non_nullable
as UserSortKey,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSortKeyCopyWith<$Res> get sortKey {
  
  return $UserSortKeyCopyWith<$Res>(_self.sortKey, (value) {
    return _then(_self.copyWith(sortKey: value));
  });
}
}

// dart format on
