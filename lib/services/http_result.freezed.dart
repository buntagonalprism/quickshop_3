// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HttpResult {

 String get uri;
/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpResultCopyWith<HttpResult> get copyWith => _$HttpResultCopyWithImpl<HttpResult>(this as HttpResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpResult&&(identical(other.uri, uri) || other.uri == uri));
}


@override
int get hashCode => Object.hash(runtimeType,uri);

@override
String toString() {
  return 'HttpResult(uri: $uri)';
}


}

/// @nodoc
abstract mixin class $HttpResultCopyWith<$Res>  {
  factory $HttpResultCopyWith(HttpResult value, $Res Function(HttpResult) _then) = _$HttpResultCopyWithImpl;
@useResult
$Res call({
 String uri
});




}
/// @nodoc
class _$HttpResultCopyWithImpl<$Res>
    implements $HttpResultCopyWith<$Res> {
  _$HttpResultCopyWithImpl(this._self, this._then);

  final HttpResult _self;
  final $Res Function(HttpResult) _then;

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uri = null,}) {
  return _then(_self.copyWith(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HttpResult].
extension HttpResultPatterns on HttpResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HttpResultSuccess value)?  success,TResult Function( HttpResultError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HttpResultSuccess() when success != null:
return success(_that);case HttpResultError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HttpResultSuccess value)  success,required TResult Function( HttpResultError value)  error,}){
final _that = this;
switch (_that) {
case HttpResultSuccess():
return success(_that);case HttpResultError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HttpResultSuccess value)?  success,TResult? Function( HttpResultError value)?  error,}){
final _that = this;
switch (_that) {
case HttpResultSuccess() when success != null:
return success(_that);case HttpResultError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String uri,  String response,  int statusCode)?  success,TResult Function( String uri,  HttpError error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HttpResultSuccess() when success != null:
return success(_that.uri,_that.response,_that.statusCode);case HttpResultError() when error != null:
return error(_that.uri,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String uri,  String response,  int statusCode)  success,required TResult Function( String uri,  HttpError error)  error,}) {final _that = this;
switch (_that) {
case HttpResultSuccess():
return success(_that.uri,_that.response,_that.statusCode);case HttpResultError():
return error(_that.uri,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String uri,  String response,  int statusCode)?  success,TResult? Function( String uri,  HttpError error)?  error,}) {final _that = this;
switch (_that) {
case HttpResultSuccess() when success != null:
return success(_that.uri,_that.response,_that.statusCode);case HttpResultError() when error != null:
return error(_that.uri,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class HttpResultSuccess extends HttpResult {
  const HttpResultSuccess({required this.uri, required this.response, required this.statusCode}): super._();
  

@override final  String uri;
 final  String response;
 final  int statusCode;

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpResultSuccessCopyWith<HttpResultSuccess> get copyWith => _$HttpResultSuccessCopyWithImpl<HttpResultSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpResultSuccess&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.response, response) || other.response == response)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,uri,response,statusCode);

@override
String toString() {
  return 'HttpResult.success(uri: $uri, response: $response, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class $HttpResultSuccessCopyWith<$Res> implements $HttpResultCopyWith<$Res> {
  factory $HttpResultSuccessCopyWith(HttpResultSuccess value, $Res Function(HttpResultSuccess) _then) = _$HttpResultSuccessCopyWithImpl;
@override @useResult
$Res call({
 String uri, String response, int statusCode
});




}
/// @nodoc
class _$HttpResultSuccessCopyWithImpl<$Res>
    implements $HttpResultSuccessCopyWith<$Res> {
  _$HttpResultSuccessCopyWithImpl(this._self, this._then);

  final HttpResultSuccess _self;
  final $Res Function(HttpResultSuccess) _then;

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? response = null,Object? statusCode = null,}) {
  return _then(HttpResultSuccess(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class HttpResultError extends HttpResult {
  const HttpResultError({required this.uri, required this.error}): super._();
  

@override final  String uri;
 final  HttpError error;

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpResultErrorCopyWith<HttpResultError> get copyWith => _$HttpResultErrorCopyWithImpl<HttpResultError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpResultError&&(identical(other.uri, uri) || other.uri == uri)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,uri,error);

@override
String toString() {
  return 'HttpResult.error(uri: $uri, error: $error)';
}


}

/// @nodoc
abstract mixin class $HttpResultErrorCopyWith<$Res> implements $HttpResultCopyWith<$Res> {
  factory $HttpResultErrorCopyWith(HttpResultError value, $Res Function(HttpResultError) _then) = _$HttpResultErrorCopyWithImpl;
@override @useResult
$Res call({
 String uri, HttpError error
});


$HttpErrorCopyWith<$Res> get error;

}
/// @nodoc
class _$HttpResultErrorCopyWithImpl<$Res>
    implements $HttpResultErrorCopyWith<$Res> {
  _$HttpResultErrorCopyWithImpl(this._self, this._then);

  final HttpResultError _self;
  final $Res Function(HttpResultError) _then;

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uri = null,Object? error = null,}) {
  return _then(HttpResultError(
uri: null == uri ? _self.uri : uri // ignore: cast_nullable_to_non_nullable
as String,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as HttpError,
  ));
}

/// Create a copy of HttpResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HttpErrorCopyWith<$Res> get error {
  
  return $HttpErrorCopyWith<$Res>(_self.error, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

/// @nodoc
mixin _$HttpError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HttpError()';
}


}

/// @nodoc
class $HttpErrorCopyWith<$Res>  {
$HttpErrorCopyWith(HttpError _, $Res Function(HttpError) __);
}


/// Adds pattern-matching-related methods to [HttpError].
extension HttpErrorPatterns on HttpError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HttpErrorTimeout value)?  timeout,TResult Function( _HttpErrorNetworkError value)?  connectionFailed,TResult Function( _HttpErrorServerBusy value)?  retryLater,TResult Function( _HttpErrorUnknown value)?  unknownError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HttpErrorTimeout() when timeout != null:
return timeout(_that);case _HttpErrorNetworkError() when connectionFailed != null:
return connectionFailed(_that);case _HttpErrorServerBusy() when retryLater != null:
return retryLater(_that);case _HttpErrorUnknown() when unknownError != null:
return unknownError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HttpErrorTimeout value)  timeout,required TResult Function( _HttpErrorNetworkError value)  connectionFailed,required TResult Function( _HttpErrorServerBusy value)  retryLater,required TResult Function( _HttpErrorUnknown value)  unknownError,}){
final _that = this;
switch (_that) {
case _HttpErrorTimeout():
return timeout(_that);case _HttpErrorNetworkError():
return connectionFailed(_that);case _HttpErrorServerBusy():
return retryLater(_that);case _HttpErrorUnknown():
return unknownError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HttpErrorTimeout value)?  timeout,TResult? Function( _HttpErrorNetworkError value)?  connectionFailed,TResult? Function( _HttpErrorServerBusy value)?  retryLater,TResult? Function( _HttpErrorUnknown value)?  unknownError,}){
final _that = this;
switch (_that) {
case _HttpErrorTimeout() when timeout != null:
return timeout(_that);case _HttpErrorNetworkError() when connectionFailed != null:
return connectionFailed(_that);case _HttpErrorServerBusy() when retryLater != null:
return retryLater(_that);case _HttpErrorUnknown() when unknownError != null:
return unknownError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  timeout,TResult Function( String errorMessage)?  connectionFailed,TResult Function( int statusCode,  String response)?  retryLater,TResult Function( int statusCode,  String response)?  unknownError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HttpErrorTimeout() when timeout != null:
return timeout();case _HttpErrorNetworkError() when connectionFailed != null:
return connectionFailed(_that.errorMessage);case _HttpErrorServerBusy() when retryLater != null:
return retryLater(_that.statusCode,_that.response);case _HttpErrorUnknown() when unknownError != null:
return unknownError(_that.statusCode,_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  timeout,required TResult Function( String errorMessage)  connectionFailed,required TResult Function( int statusCode,  String response)  retryLater,required TResult Function( int statusCode,  String response)  unknownError,}) {final _that = this;
switch (_that) {
case _HttpErrorTimeout():
return timeout();case _HttpErrorNetworkError():
return connectionFailed(_that.errorMessage);case _HttpErrorServerBusy():
return retryLater(_that.statusCode,_that.response);case _HttpErrorUnknown():
return unknownError(_that.statusCode,_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  timeout,TResult? Function( String errorMessage)?  connectionFailed,TResult? Function( int statusCode,  String response)?  retryLater,TResult? Function( int statusCode,  String response)?  unknownError,}) {final _that = this;
switch (_that) {
case _HttpErrorTimeout() when timeout != null:
return timeout();case _HttpErrorNetworkError() when connectionFailed != null:
return connectionFailed(_that.errorMessage);case _HttpErrorServerBusy() when retryLater != null:
return retryLater(_that.statusCode,_that.response);case _HttpErrorUnknown() when unknownError != null:
return unknownError(_that.statusCode,_that.response);case _:
  return null;

}
}

}

/// @nodoc


class _HttpErrorTimeout extends HttpError {
  const _HttpErrorTimeout(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpErrorTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HttpError.timeout()';
}


}




/// @nodoc


class _HttpErrorNetworkError extends HttpError {
  const _HttpErrorNetworkError({required this.errorMessage}): super._();
  

 final  String errorMessage;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HttpErrorNetworkErrorCopyWith<_HttpErrorNetworkError> get copyWith => __$HttpErrorNetworkErrorCopyWithImpl<_HttpErrorNetworkError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpErrorNetworkError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'HttpError.connectionFailed(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HttpErrorNetworkErrorCopyWith<$Res> implements $HttpErrorCopyWith<$Res> {
  factory _$HttpErrorNetworkErrorCopyWith(_HttpErrorNetworkError value, $Res Function(_HttpErrorNetworkError) _then) = __$HttpErrorNetworkErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class __$HttpErrorNetworkErrorCopyWithImpl<$Res>
    implements _$HttpErrorNetworkErrorCopyWith<$Res> {
  __$HttpErrorNetworkErrorCopyWithImpl(this._self, this._then);

  final _HttpErrorNetworkError _self;
  final $Res Function(_HttpErrorNetworkError) _then;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(_HttpErrorNetworkError(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HttpErrorServerBusy extends HttpError {
  const _HttpErrorServerBusy({required this.statusCode, required this.response}): super._();
  

 final  int statusCode;
 final  String response;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HttpErrorServerBusyCopyWith<_HttpErrorServerBusy> get copyWith => __$HttpErrorServerBusyCopyWithImpl<_HttpErrorServerBusy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpErrorServerBusy&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,response);

@override
String toString() {
  return 'HttpError.retryLater(statusCode: $statusCode, response: $response)';
}


}

/// @nodoc
abstract mixin class _$HttpErrorServerBusyCopyWith<$Res> implements $HttpErrorCopyWith<$Res> {
  factory _$HttpErrorServerBusyCopyWith(_HttpErrorServerBusy value, $Res Function(_HttpErrorServerBusy) _then) = __$HttpErrorServerBusyCopyWithImpl;
@useResult
$Res call({
 int statusCode, String response
});




}
/// @nodoc
class __$HttpErrorServerBusyCopyWithImpl<$Res>
    implements _$HttpErrorServerBusyCopyWith<$Res> {
  __$HttpErrorServerBusyCopyWithImpl(this._self, this._then);

  final _HttpErrorServerBusy _self;
  final $Res Function(_HttpErrorServerBusy) _then;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? response = null,}) {
  return _then(_HttpErrorServerBusy(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _HttpErrorUnknown extends HttpError {
  const _HttpErrorUnknown({required this.statusCode, required this.response}): super._();
  

 final  int statusCode;
 final  String response;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HttpErrorUnknownCopyWith<_HttpErrorUnknown> get copyWith => __$HttpErrorUnknownCopyWithImpl<_HttpErrorUnknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HttpErrorUnknown&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,statusCode,response);

@override
String toString() {
  return 'HttpError.unknownError(statusCode: $statusCode, response: $response)';
}


}

/// @nodoc
abstract mixin class _$HttpErrorUnknownCopyWith<$Res> implements $HttpErrorCopyWith<$Res> {
  factory _$HttpErrorUnknownCopyWith(_HttpErrorUnknown value, $Res Function(_HttpErrorUnknown) _then) = __$HttpErrorUnknownCopyWithImpl;
@useResult
$Res call({
 int statusCode, String response
});




}
/// @nodoc
class __$HttpErrorUnknownCopyWithImpl<$Res>
    implements _$HttpErrorUnknownCopyWith<$Res> {
  __$HttpErrorUnknownCopyWithImpl(this._self, this._then);

  final _HttpErrorUnknown _self;
  final $Res Function(_HttpErrorUnknown) _then;

/// Create a copy of HttpError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusCode = null,Object? response = null,}) {
  return _then(_HttpErrorUnknown(
statusCode: null == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
