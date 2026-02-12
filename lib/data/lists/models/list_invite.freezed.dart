// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_invite.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListInvite {

 String get id; String get listId; ListType get listType; String get listName; String get inviterId; String get inviterName;
/// Create a copy of ListInvite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListInviteCopyWith<ListInvite> get copyWith => _$ListInviteCopyWithImpl<ListInvite>(this as ListInvite, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.listType, listType) || other.listType == listType)&&(identical(other.listName, listName) || other.listName == listName)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.inviterName, inviterName) || other.inviterName == inviterName));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,listType,listName,inviterId,inviterName);

@override
String toString() {
  return 'ListInvite(id: $id, listId: $listId, listType: $listType, listName: $listName, inviterId: $inviterId, inviterName: $inviterName)';
}


}

/// @nodoc
abstract mixin class $ListInviteCopyWith<$Res>  {
  factory $ListInviteCopyWith(ListInvite value, $Res Function(ListInvite) _then) = _$ListInviteCopyWithImpl;
@useResult
$Res call({
 String id, String listId, ListType listType, String listName, String inviterId, String inviterName
});




}
/// @nodoc
class _$ListInviteCopyWithImpl<$Res>
    implements $ListInviteCopyWith<$Res> {
  _$ListInviteCopyWithImpl(this._self, this._then);

  final ListInvite _self;
  final $Res Function(ListInvite) _then;

/// Create a copy of ListInvite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listId = null,Object? listType = null,Object? listName = null,Object? inviterId = null,Object? inviterName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listId: null == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String,listType: null == listType ? _self.listType : listType // ignore: cast_nullable_to_non_nullable
as ListType,listName: null == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String,inviterId: null == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as String,inviterName: null == inviterName ? _self.inviterName : inviterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ListInvite].
extension ListInvitePatterns on ListInvite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListInvite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListInvite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListInvite value)  $default,){
final _that = this;
switch (_that) {
case _ListInvite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListInvite value)?  $default,){
final _that = this;
switch (_that) {
case _ListInvite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String listId,  ListType listType,  String listName,  String inviterId,  String inviterName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListInvite() when $default != null:
return $default(_that.id,_that.listId,_that.listType,_that.listName,_that.inviterId,_that.inviterName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String listId,  ListType listType,  String listName,  String inviterId,  String inviterName)  $default,) {final _that = this;
switch (_that) {
case _ListInvite():
return $default(_that.id,_that.listId,_that.listType,_that.listName,_that.inviterId,_that.inviterName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String listId,  ListType listType,  String listName,  String inviterId,  String inviterName)?  $default,) {final _that = this;
switch (_that) {
case _ListInvite() when $default != null:
return $default(_that.id,_that.listId,_that.listType,_that.listName,_that.inviterId,_that.inviterName);case _:
  return null;

}
}

}

/// @nodoc


class _ListInvite extends ListInvite {
  const _ListInvite({required this.id, required this.listId, required this.listType, required this.listName, required this.inviterId, required this.inviterName}): super._();
  

@override final  String id;
@override final  String listId;
@override final  ListType listType;
@override final  String listName;
@override final  String inviterId;
@override final  String inviterName;

/// Create a copy of ListInvite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListInviteCopyWith<_ListInvite> get copyWith => __$ListInviteCopyWithImpl<_ListInvite>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListInvite&&(identical(other.id, id) || other.id == id)&&(identical(other.listId, listId) || other.listId == listId)&&(identical(other.listType, listType) || other.listType == listType)&&(identical(other.listName, listName) || other.listName == listName)&&(identical(other.inviterId, inviterId) || other.inviterId == inviterId)&&(identical(other.inviterName, inviterName) || other.inviterName == inviterName));
}


@override
int get hashCode => Object.hash(runtimeType,id,listId,listType,listName,inviterId,inviterName);

@override
String toString() {
  return 'ListInvite(id: $id, listId: $listId, listType: $listType, listName: $listName, inviterId: $inviterId, inviterName: $inviterName)';
}


}

/// @nodoc
abstract mixin class _$ListInviteCopyWith<$Res> implements $ListInviteCopyWith<$Res> {
  factory _$ListInviteCopyWith(_ListInvite value, $Res Function(_ListInvite) _then) = __$ListInviteCopyWithImpl;
@override @useResult
$Res call({
 String id, String listId, ListType listType, String listName, String inviterId, String inviterName
});




}
/// @nodoc
class __$ListInviteCopyWithImpl<$Res>
    implements _$ListInviteCopyWith<$Res> {
  __$ListInviteCopyWithImpl(this._self, this._then);

  final _ListInvite _self;
  final $Res Function(_ListInvite) _then;

/// Create a copy of ListInvite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listId = null,Object? listType = null,Object? listName = null,Object? inviterId = null,Object? inviterName = null,}) {
  return _then(_ListInvite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listId: null == listId ? _self.listId : listId // ignore: cast_nullable_to_non_nullable
as String,listType: null == listType ? _self.listType : listType // ignore: cast_nullable_to_non_nullable
as ListType,listName: null == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String,inviterId: null == inviterId ? _self.inviterId : inviterId // ignore: cast_nullable_to_non_nullable
as String,inviterName: null == inviterName ? _self.inviterName : inviterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
