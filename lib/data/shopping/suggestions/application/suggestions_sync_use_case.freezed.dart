// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestions_sync_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SuggestionsSyncRequest {

 String get userId; String get langCode; DateTime get lastUpdated;
/// Create a copy of SuggestionsSyncRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionsSyncRequestCopyWith<SuggestionsSyncRequest> get copyWith => _$SuggestionsSyncRequestCopyWithImpl<SuggestionsSyncRequest>(this as SuggestionsSyncRequest, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SuggestionsSyncRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionsSyncRequest&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.langCode, _this.langCode) || other.langCode == _this.langCode)&&(identical(other.lastUpdated, _this.lastUpdated) || other.lastUpdated == _this.lastUpdated));
}


@override
int get hashCode {
  final _this = this as SuggestionsSyncRequest;
  return Object.hash(runtimeType,_this.userId,_this.langCode,_this.lastUpdated);
}

@override
String toString() {
  final _this = this as SuggestionsSyncRequest;
  return 'SuggestionsSyncRequest(userId: ${_this.userId}, langCode: ${_this.langCode}, lastUpdated: ${_this.lastUpdated})';
}


}

/// @nodoc
abstract mixin class $SuggestionsSyncRequestCopyWith<$Res>  {
  factory $SuggestionsSyncRequestCopyWith(SuggestionsSyncRequest value, $Res Function(SuggestionsSyncRequest) _then) = _$SuggestionsSyncRequestCopyWithImpl;
@useResult
$Res call({
 String userId, String langCode, DateTime lastUpdated
});




}
/// @nodoc
class _$SuggestionsSyncRequestCopyWithImpl<$Res>
    implements $SuggestionsSyncRequestCopyWith<$Res> {
  _$SuggestionsSyncRequestCopyWithImpl(this._self, this._then);

  final SuggestionsSyncRequest _self;
  final $Res Function(SuggestionsSyncRequest) _then;

/// Create a copy of SuggestionsSyncRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? langCode = null,Object? lastUpdated = null,}) {
  return _then(SuggestionsSyncRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,langCode: null == langCode ? _self.langCode : langCode // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SuggestionsSyncRequest].
extension SuggestionsSyncRequestPatterns on SuggestionsSyncRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestionsSyncRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionsSyncRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestionsSyncRequest value)  $default,){
final _that = this;
switch (_that) {
case _SuggestionsSyncRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestionsSyncRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestionsSyncRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String langCode,  DateTime lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionsSyncRequest() when $default != null:
return $default(_that.userId,_that.langCode,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String langCode,  DateTime lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _SuggestionsSyncRequest():
return $default(_that.userId,_that.langCode,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String langCode,  DateTime lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _SuggestionsSyncRequest() when $default != null:
return $default(_that.userId,_that.langCode,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc


class _SuggestionsSyncRequest implements SuggestionsSyncRequest {
  const _SuggestionsSyncRequest({required this.userId, required this.langCode, required this.lastUpdated});
  

@override final  String userId;
@override final  String langCode;
@override final  DateTime lastUpdated;

/// Create a copy of SuggestionsSyncRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionsSyncRequestCopyWith<_SuggestionsSyncRequest> get copyWith => __$SuggestionsSyncRequestCopyWithImpl<_SuggestionsSyncRequest>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionsSyncRequest&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.langCode, langCode) || other.langCode == langCode)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userId,langCode,lastUpdated);
}

@override
String toString() {
    return 'SuggestionsSyncRequest(userId: $userId, langCode: $langCode, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$SuggestionsSyncRequestCopyWith<$Res> implements $SuggestionsSyncRequestCopyWith<$Res> {
  factory _$SuggestionsSyncRequestCopyWith(_SuggestionsSyncRequest value, $Res Function(_SuggestionsSyncRequest) _then) = __$SuggestionsSyncRequestCopyWithImpl;
@override @useResult
$Res call({
 String userId, String langCode, DateTime lastUpdated
});




}
/// @nodoc
class __$SuggestionsSyncRequestCopyWithImpl<$Res>
    implements _$SuggestionsSyncRequestCopyWith<$Res> {
  __$SuggestionsSyncRequestCopyWithImpl(this._self, this._then);

  final _SuggestionsSyncRequest _self;
  final $Res Function(_SuggestionsSyncRequest) _then;

/// Create a copy of SuggestionsSyncRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? langCode = null,Object? lastUpdated = null,}) {
  return _then(_SuggestionsSyncRequest(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,langCode: null == langCode ? _self.langCode : langCode // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
