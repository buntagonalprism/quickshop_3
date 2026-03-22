// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Store {

 String get id; String get storeName;/// The ID of the user who created the store
 String get ownerId;/// List of user IDs who can edit the store, including the owner
 List<String> get editorIds;/// List of user details of users who can edit the store, including the owner
 List<UserAuth> get editors;/// Optional geographic coordinates of the store, used to suggest nearby stores
 Coordinates? get coordinates;/// Optional loyalty card details for the store, to be shown at the end of shopping
 LoyaltyCard? get loyaltyCard;/// List of distinct locations within the store
 List<StoreLocation> get locations;
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreCopyWith<Store> get copyWith => _$StoreCopyWithImpl<Store>(this as Store, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Store&&(identical(other.id, id) || other.id == id)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other.editorIds, editorIds)&&const DeepCollectionEquality().equals(other.editors, editors)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.loyaltyCard, loyaltyCard) || other.loyaltyCard == loyaltyCard)&&const DeepCollectionEquality().equals(other.locations, locations));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeName,ownerId,const DeepCollectionEquality().hash(editorIds),const DeepCollectionEquality().hash(editors),coordinates,loyaltyCard,const DeepCollectionEquality().hash(locations));

@override
String toString() {
  return 'Store(id: $id, storeName: $storeName, ownerId: $ownerId, editorIds: $editorIds, editors: $editors, coordinates: $coordinates, loyaltyCard: $loyaltyCard, locations: $locations)';
}


}

/// @nodoc
abstract mixin class $StoreCopyWith<$Res>  {
  factory $StoreCopyWith(Store value, $Res Function(Store) _then) = _$StoreCopyWithImpl;
@useResult
$Res call({
 String id, String storeName, String ownerId, List<String> editorIds, List<UserAuth> editors, Coordinates? coordinates, LoyaltyCard? loyaltyCard, List<StoreLocation> locations
});


$CoordinatesCopyWith<$Res>? get coordinates;$LoyaltyCardCopyWith<$Res>? get loyaltyCard;

}
/// @nodoc
class _$StoreCopyWithImpl<$Res>
    implements $StoreCopyWith<$Res> {
  _$StoreCopyWithImpl(this._self, this._then);

  final Store _self;
  final $Res Function(Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? storeName = null,Object? ownerId = null,Object? editorIds = null,Object? editors = null,Object? coordinates = freezed,Object? loyaltyCard = freezed,Object? locations = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,editorIds: null == editorIds ? _self.editorIds : editorIds // ignore: cast_nullable_to_non_nullable
as List<String>,editors: null == editors ? _self.editors : editors // ignore: cast_nullable_to_non_nullable
as List<UserAuth>,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,loyaltyCard: freezed == loyaltyCard ? _self.loyaltyCard : loyaltyCard // ignore: cast_nullable_to_non_nullable
as LoyaltyCard?,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<StoreLocation>,
  ));
}
/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoyaltyCardCopyWith<$Res>? get loyaltyCard {
    if (_self.loyaltyCard == null) {
    return null;
  }

  return $LoyaltyCardCopyWith<$Res>(_self.loyaltyCard!, (value) {
    return _then(_self.copyWith(loyaltyCard: value));
  });
}
}


/// Adds pattern-matching-related methods to [Store].
extension StorePatterns on Store {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Store value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Store value)  $default,){
final _that = this;
switch (_that) {
case _Store():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Store value)?  $default,){
final _that = this;
switch (_that) {
case _Store() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String storeName,  String ownerId,  List<String> editorIds,  List<UserAuth> editors,  Coordinates? coordinates,  LoyaltyCard? loyaltyCard,  List<StoreLocation> locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.id,_that.storeName,_that.ownerId,_that.editorIds,_that.editors,_that.coordinates,_that.loyaltyCard,_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String storeName,  String ownerId,  List<String> editorIds,  List<UserAuth> editors,  Coordinates? coordinates,  LoyaltyCard? loyaltyCard,  List<StoreLocation> locations)  $default,) {final _that = this;
switch (_that) {
case _Store():
return $default(_that.id,_that.storeName,_that.ownerId,_that.editorIds,_that.editors,_that.coordinates,_that.loyaltyCard,_that.locations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String storeName,  String ownerId,  List<String> editorIds,  List<UserAuth> editors,  Coordinates? coordinates,  LoyaltyCard? loyaltyCard,  List<StoreLocation> locations)?  $default,) {final _that = this;
switch (_that) {
case _Store() when $default != null:
return $default(_that.id,_that.storeName,_that.ownerId,_that.editorIds,_that.editors,_that.coordinates,_that.loyaltyCard,_that.locations);case _:
  return null;

}
}

}

/// @nodoc


class _Store extends Store {
  const _Store({required this.id, required this.storeName, required this.ownerId, required final  List<String> editorIds, required final  List<UserAuth> editors, this.coordinates, this.loyaltyCard, required final  List<StoreLocation> locations}): _editorIds = editorIds,_editors = editors,_locations = locations,super._();
  

@override final  String id;
@override final  String storeName;
/// The ID of the user who created the store
@override final  String ownerId;
/// List of user IDs who can edit the store, including the owner
 final  List<String> _editorIds;
/// List of user IDs who can edit the store, including the owner
@override List<String> get editorIds {
  if (_editorIds is EqualUnmodifiableListView) return _editorIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editorIds);
}

/// List of user details of users who can edit the store, including the owner
 final  List<UserAuth> _editors;
/// List of user details of users who can edit the store, including the owner
@override List<UserAuth> get editors {
  if (_editors is EqualUnmodifiableListView) return _editors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_editors);
}

/// Optional geographic coordinates of the store, used to suggest nearby stores
@override final  Coordinates? coordinates;
/// Optional loyalty card details for the store, to be shown at the end of shopping
@override final  LoyaltyCard? loyaltyCard;
/// List of distinct locations within the store
 final  List<StoreLocation> _locations;
/// List of distinct locations within the store
@override List<StoreLocation> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}


/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreCopyWith<_Store> get copyWith => __$StoreCopyWithImpl<_Store>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Store&&(identical(other.id, id) || other.id == id)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&const DeepCollectionEquality().equals(other._editorIds, _editorIds)&&const DeepCollectionEquality().equals(other._editors, _editors)&&(identical(other.coordinates, coordinates) || other.coordinates == coordinates)&&(identical(other.loyaltyCard, loyaltyCard) || other.loyaltyCard == loyaltyCard)&&const DeepCollectionEquality().equals(other._locations, _locations));
}


@override
int get hashCode => Object.hash(runtimeType,id,storeName,ownerId,const DeepCollectionEquality().hash(_editorIds),const DeepCollectionEquality().hash(_editors),coordinates,loyaltyCard,const DeepCollectionEquality().hash(_locations));

@override
String toString() {
  return 'Store(id: $id, storeName: $storeName, ownerId: $ownerId, editorIds: $editorIds, editors: $editors, coordinates: $coordinates, loyaltyCard: $loyaltyCard, locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$StoreCopyWith<$Res> implements $StoreCopyWith<$Res> {
  factory _$StoreCopyWith(_Store value, $Res Function(_Store) _then) = __$StoreCopyWithImpl;
@override @useResult
$Res call({
 String id, String storeName, String ownerId, List<String> editorIds, List<UserAuth> editors, Coordinates? coordinates, LoyaltyCard? loyaltyCard, List<StoreLocation> locations
});


@override $CoordinatesCopyWith<$Res>? get coordinates;@override $LoyaltyCardCopyWith<$Res>? get loyaltyCard;

}
/// @nodoc
class __$StoreCopyWithImpl<$Res>
    implements _$StoreCopyWith<$Res> {
  __$StoreCopyWithImpl(this._self, this._then);

  final _Store _self;
  final $Res Function(_Store) _then;

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? storeName = null,Object? ownerId = null,Object? editorIds = null,Object? editors = null,Object? coordinates = freezed,Object? loyaltyCard = freezed,Object? locations = null,}) {
  return _then(_Store(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,editorIds: null == editorIds ? _self._editorIds : editorIds // ignore: cast_nullable_to_non_nullable
as List<String>,editors: null == editors ? _self._editors : editors // ignore: cast_nullable_to_non_nullable
as List<UserAuth>,coordinates: freezed == coordinates ? _self.coordinates : coordinates // ignore: cast_nullable_to_non_nullable
as Coordinates?,loyaltyCard: freezed == loyaltyCard ? _self.loyaltyCard : loyaltyCard // ignore: cast_nullable_to_non_nullable
as LoyaltyCard?,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<StoreLocation>,
  ));
}

/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
    return null;
  }

  return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
    return _then(_self.copyWith(coordinates: value));
  });
}/// Create a copy of Store
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoyaltyCardCopyWith<$Res>? get loyaltyCard {
    if (_self.loyaltyCard == null) {
    return null;
  }

  return $LoyaltyCardCopyWith<$Res>(_self.loyaltyCard!, (value) {
    return _then(_self.copyWith(loyaltyCard: value));
  });
}
}

// dart format on
