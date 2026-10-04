// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_invite_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InviteStatus {

 ListInvite get invite;
/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteStatusCopyWith<InviteStatus> get copyWith => _$InviteStatusCopyWithImpl<InviteStatus>(this as InviteStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as InviteStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteStatus&&(identical(other.invite, _this.invite) || other.invite == _this.invite));
}


@override
int get hashCode {
  final _this = this as InviteStatus;
  return Object.hash(runtimeType,_this.invite);
}

@override
String toString() {
  final _this = this as InviteStatus;
  return 'InviteStatus(invite: ${_this.invite})';
}


}

/// @nodoc
abstract mixin class $InviteStatusCopyWith<$Res>  {
  factory $InviteStatusCopyWith(InviteStatus value, $Res Function(InviteStatus) _then) = _$InviteStatusCopyWithImpl;
@useResult
$Res call({
 ListInvite invite
});


$ListInviteCopyWith<$Res> get invite;

}
/// @nodoc
class _$InviteStatusCopyWithImpl<$Res>
    implements $InviteStatusCopyWith<$Res> {
  _$InviteStatusCopyWithImpl(this._self, this._then);

  final InviteStatus _self;
  final $Res Function(InviteStatus) _then;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invite = null,}) {
  return _then(_self.copyWith(
invite: null == invite ? _self.invite : invite // ignore: cast_nullable_to_non_nullable
as ListInvite,
  ));
}
/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListInviteCopyWith<$Res> get invite {
  
  return $ListInviteCopyWith<$Res>(_self.invite, (value) {
    return _then(_self.copyWith(invite: value));
  });
}
}


/// Adds pattern-matching-related methods to [InviteStatus].
extension InviteStatusPatterns on InviteStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IsOwner value)?  isOwner,TResult Function( _Pending value)?  pending,TResult Function( _Accepted value)?  accepted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsOwner() when isOwner != null:
return isOwner(_that);case _Pending() when pending != null:
return pending(_that);case _Accepted() when accepted != null:
return accepted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IsOwner value)  isOwner,required TResult Function( _Pending value)  pending,required TResult Function( _Accepted value)  accepted,}){
final _that = this;
switch (_that) {
case _IsOwner():
return isOwner(_that);case _Pending():
return pending(_that);case _Accepted():
return accepted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IsOwner value)?  isOwner,TResult? Function( _Pending value)?  pending,TResult? Function( _Accepted value)?  accepted,}){
final _that = this;
switch (_that) {
case _IsOwner() when isOwner != null:
return isOwner(_that);case _Pending() when pending != null:
return pending(_that);case _Accepted() when accepted != null:
return accepted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ListInvite invite)?  isOwner,TResult Function( ListInvite invite)?  pending,TResult Function( ListInvite invite)?  accepted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsOwner() when isOwner != null:
return isOwner(_that.invite);case _Pending() when pending != null:
return pending(_that.invite);case _Accepted() when accepted != null:
return accepted(_that.invite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ListInvite invite)  isOwner,required TResult Function( ListInvite invite)  pending,required TResult Function( ListInvite invite)  accepted,}) {final _that = this;
switch (_that) {
case _IsOwner():
return isOwner(_that.invite);case _Pending():
return pending(_that.invite);case _Accepted():
return accepted(_that.invite);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ListInvite invite)?  isOwner,TResult? Function( ListInvite invite)?  pending,TResult? Function( ListInvite invite)?  accepted,}) {final _that = this;
switch (_that) {
case _IsOwner() when isOwner != null:
return isOwner(_that.invite);case _Pending() when pending != null:
return pending(_that.invite);case _Accepted() when accepted != null:
return accepted(_that.invite);case _:
  return null;

}
}

}

/// @nodoc


class _IsOwner implements InviteStatus {
  const _IsOwner(this.invite);
  

@override final  ListInvite invite;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsOwnerCopyWith<_IsOwner> get copyWith => __$IsOwnerCopyWithImpl<_IsOwner>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsOwner&&(identical(other.invite, invite) || other.invite == invite));
}


@override
int get hashCode {
    return Object.hash(runtimeType,invite);
}

@override
String toString() {
    return 'InviteStatus.isOwner(invite: $invite)';
}


}

/// @nodoc
abstract mixin class _$IsOwnerCopyWith<$Res> implements $InviteStatusCopyWith<$Res> {
  factory _$IsOwnerCopyWith(_IsOwner value, $Res Function(_IsOwner) _then) = __$IsOwnerCopyWithImpl;
@override @useResult
$Res call({
 ListInvite invite
});


@override $ListInviteCopyWith<$Res> get invite;

}
/// @nodoc
class __$IsOwnerCopyWithImpl<$Res>
    implements _$IsOwnerCopyWith<$Res> {
  __$IsOwnerCopyWithImpl(this._self, this._then);

  final _IsOwner _self;
  final $Res Function(_IsOwner) _then;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invite = null,}) {
  return _then(_IsOwner(
null == invite ? _self.invite : invite // ignore: cast_nullable_to_non_nullable
as ListInvite,
  ));
}

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListInviteCopyWith<$Res> get invite {
  
  return $ListInviteCopyWith<$Res>(_self.invite, (value) {
    return _then(_self.copyWith(invite: value));
  });
}
}

/// @nodoc


class _Pending implements InviteStatus {
  const _Pending(this.invite);
  

@override final  ListInvite invite;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingCopyWith<_Pending> get copyWith => __$PendingCopyWithImpl<_Pending>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pending&&(identical(other.invite, invite) || other.invite == invite));
}


@override
int get hashCode {
    return Object.hash(runtimeType,invite);
}

@override
String toString() {
    return 'InviteStatus.pending(invite: $invite)';
}


}

/// @nodoc
abstract mixin class _$PendingCopyWith<$Res> implements $InviteStatusCopyWith<$Res> {
  factory _$PendingCopyWith(_Pending value, $Res Function(_Pending) _then) = __$PendingCopyWithImpl;
@override @useResult
$Res call({
 ListInvite invite
});


@override $ListInviteCopyWith<$Res> get invite;

}
/// @nodoc
class __$PendingCopyWithImpl<$Res>
    implements _$PendingCopyWith<$Res> {
  __$PendingCopyWithImpl(this._self, this._then);

  final _Pending _self;
  final $Res Function(_Pending) _then;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invite = null,}) {
  return _then(_Pending(
null == invite ? _self.invite : invite // ignore: cast_nullable_to_non_nullable
as ListInvite,
  ));
}

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListInviteCopyWith<$Res> get invite {
  
  return $ListInviteCopyWith<$Res>(_self.invite, (value) {
    return _then(_self.copyWith(invite: value));
  });
}
}

/// @nodoc


class _Accepted implements InviteStatus {
  const _Accepted(this.invite);
  

@override final  ListInvite invite;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AcceptedCopyWith<_Accepted> get copyWith => __$AcceptedCopyWithImpl<_Accepted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Accepted&&(identical(other.invite, invite) || other.invite == invite));
}


@override
int get hashCode {
    return Object.hash(runtimeType,invite);
}

@override
String toString() {
    return 'InviteStatus.accepted(invite: $invite)';
}


}

/// @nodoc
abstract mixin class _$AcceptedCopyWith<$Res> implements $InviteStatusCopyWith<$Res> {
  factory _$AcceptedCopyWith(_Accepted value, $Res Function(_Accepted) _then) = __$AcceptedCopyWithImpl;
@override @useResult
$Res call({
 ListInvite invite
});


@override $ListInviteCopyWith<$Res> get invite;

}
/// @nodoc
class __$AcceptedCopyWithImpl<$Res>
    implements _$AcceptedCopyWith<$Res> {
  __$AcceptedCopyWithImpl(this._self, this._then);

  final _Accepted _self;
  final $Res Function(_Accepted) _then;

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invite = null,}) {
  return _then(_Accepted(
null == invite ? _self.invite : invite // ignore: cast_nullable_to_non_nullable
as ListInvite,
  ));
}

/// Create a copy of InviteStatus
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListInviteCopyWith<$Res> get invite {
  
  return $ListInviteCopyWith<$Res>(_self.invite, (value) {
    return _then(_self.copyWith(invite: value));
  });
}
}

// dart format on
