// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfile {

 String get userId; DateTime? get lastHistoryUpdate; int? get hiddenSuggestionsVersion; List<String>? get completedTutorials;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastHistoryUpdate, lastHistoryUpdate) || other.lastHistoryUpdate == lastHistoryUpdate)&&(identical(other.hiddenSuggestionsVersion, hiddenSuggestionsVersion) || other.hiddenSuggestionsVersion == hiddenSuggestionsVersion)&&const DeepCollectionEquality().equals(other.completedTutorials, completedTutorials));
}


@override
int get hashCode => Object.hash(runtimeType,userId,lastHistoryUpdate,hiddenSuggestionsVersion,const DeepCollectionEquality().hash(completedTutorials));

@override
String toString() {
  return 'UserProfile(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, hiddenSuggestionsVersion: $hiddenSuggestionsVersion, completedTutorials: $completedTutorials)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String userId, DateTime? lastHistoryUpdate, int? hiddenSuggestionsVersion, List<String>? completedTutorials
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? lastHistoryUpdate = freezed,Object? hiddenSuggestionsVersion = freezed,Object? completedTutorials = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lastHistoryUpdate: freezed == lastHistoryUpdate ? _self.lastHistoryUpdate : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,hiddenSuggestionsVersion: freezed == hiddenSuggestionsVersion ? _self.hiddenSuggestionsVersion : hiddenSuggestionsVersion // ignore: cast_nullable_to_non_nullable
as int?,completedTutorials: freezed == completedTutorials ? _self.completedTutorials : completedTutorials // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  DateTime? lastHistoryUpdate,  int? hiddenSuggestionsVersion,  List<String>? completedTutorials)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.userId,_that.lastHistoryUpdate,_that.hiddenSuggestionsVersion,_that.completedTutorials);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  DateTime? lastHistoryUpdate,  int? hiddenSuggestionsVersion,  List<String>? completedTutorials)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.userId,_that.lastHistoryUpdate,_that.hiddenSuggestionsVersion,_that.completedTutorials);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  DateTime? lastHistoryUpdate,  int? hiddenSuggestionsVersion,  List<String>? completedTutorials)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.userId,_that.lastHistoryUpdate,_that.hiddenSuggestionsVersion,_that.completedTutorials);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfile extends UserProfile {
  const _UserProfile({required this.userId, this.lastHistoryUpdate, this.hiddenSuggestionsVersion, final  List<String>? completedTutorials}): _completedTutorials = completedTutorials,super._();
  

@override final  String userId;
@override final  DateTime? lastHistoryUpdate;
@override final  int? hiddenSuggestionsVersion;
 final  List<String>? _completedTutorials;
@override List<String>? get completedTutorials {
  final value = _completedTutorials;
  if (value == null) return null;
  if (_completedTutorials is EqualUnmodifiableListView) return _completedTutorials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastHistoryUpdate, lastHistoryUpdate) || other.lastHistoryUpdate == lastHistoryUpdate)&&(identical(other.hiddenSuggestionsVersion, hiddenSuggestionsVersion) || other.hiddenSuggestionsVersion == hiddenSuggestionsVersion)&&const DeepCollectionEquality().equals(other._completedTutorials, _completedTutorials));
}


@override
int get hashCode => Object.hash(runtimeType,userId,lastHistoryUpdate,hiddenSuggestionsVersion,const DeepCollectionEquality().hash(_completedTutorials));

@override
String toString() {
  return 'UserProfile(userId: $userId, lastHistoryUpdate: $lastHistoryUpdate, hiddenSuggestionsVersion: $hiddenSuggestionsVersion, completedTutorials: $completedTutorials)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String userId, DateTime? lastHistoryUpdate, int? hiddenSuggestionsVersion, List<String>? completedTutorials
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? lastHistoryUpdate = freezed,Object? hiddenSuggestionsVersion = freezed,Object? completedTutorials = freezed,}) {
  return _then(_UserProfile(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lastHistoryUpdate: freezed == lastHistoryUpdate ? _self.lastHistoryUpdate : lastHistoryUpdate // ignore: cast_nullable_to_non_nullable
as DateTime?,hiddenSuggestionsVersion: freezed == hiddenSuggestionsVersion ? _self.hiddenSuggestionsVersion : hiddenSuggestionsVersion // ignore: cast_nullable_to_non_nullable
as int?,completedTutorials: freezed == completedTutorials ? _self._completedTutorials : completedTutorials // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
