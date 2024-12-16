// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HttpResult {
  String get uri => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uri, String response, int statusCode)
        success,
    required TResult Function(String uri, HttpError error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uri, String response, int statusCode)? success,
    TResult? Function(String uri, HttpError error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uri, String response, int statusCode)? success,
    TResult Function(String uri, HttpError error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpResultSuccess value) success,
    required TResult Function(HttpResultError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpResultSuccess value)? success,
    TResult? Function(HttpResultError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpResultSuccess value)? success,
    TResult Function(HttpResultError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HttpResultCopyWith<HttpResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpResultCopyWith<$Res> {
  factory $HttpResultCopyWith(
          HttpResult value, $Res Function(HttpResult) then) =
      _$HttpResultCopyWithImpl<$Res, HttpResult>;
  @useResult
  $Res call({String uri});
}

/// @nodoc
class _$HttpResultCopyWithImpl<$Res, $Val extends HttpResult>
    implements $HttpResultCopyWith<$Res> {
  _$HttpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HttpResultSuccessImplCopyWith<$Res>
    implements $HttpResultCopyWith<$Res> {
  factory _$$HttpResultSuccessImplCopyWith(_$HttpResultSuccessImpl value,
          $Res Function(_$HttpResultSuccessImpl) then) =
      __$$HttpResultSuccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uri, String response, int statusCode});
}

/// @nodoc
class __$$HttpResultSuccessImplCopyWithImpl<$Res>
    extends _$HttpResultCopyWithImpl<$Res, _$HttpResultSuccessImpl>
    implements _$$HttpResultSuccessImplCopyWith<$Res> {
  __$$HttpResultSuccessImplCopyWithImpl(_$HttpResultSuccessImpl _value,
      $Res Function(_$HttpResultSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? response = null,
    Object? statusCode = null,
  }) {
    return _then(_$HttpResultSuccessImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HttpResultSuccessImpl extends HttpResultSuccess {
  const _$HttpResultSuccessImpl(
      {required this.uri, required this.response, required this.statusCode})
      : super._();

  @override
  final String uri;
  @override
  final String response;
  @override
  final int statusCode;

  @override
  String toString() {
    return 'HttpResult.success(uri: $uri, response: $response, statusCode: $statusCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpResultSuccessImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri, response, statusCode);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpResultSuccessImplCopyWith<_$HttpResultSuccessImpl> get copyWith =>
      __$$HttpResultSuccessImplCopyWithImpl<_$HttpResultSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uri, String response, int statusCode)
        success,
    required TResult Function(String uri, HttpError error) error,
  }) {
    return success(uri, response, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uri, String response, int statusCode)? success,
    TResult? Function(String uri, HttpError error)? error,
  }) {
    return success?.call(uri, response, statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uri, String response, int statusCode)? success,
    TResult Function(String uri, HttpError error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(uri, response, statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpResultSuccess value) success,
    required TResult Function(HttpResultError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpResultSuccess value)? success,
    TResult? Function(HttpResultError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpResultSuccess value)? success,
    TResult Function(HttpResultError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HttpResultSuccess extends HttpResult {
  const factory HttpResultSuccess(
      {required final String uri,
      required final String response,
      required final int statusCode}) = _$HttpResultSuccessImpl;
  const HttpResultSuccess._() : super._();

  @override
  String get uri;
  String get response;
  int get statusCode;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpResultSuccessImplCopyWith<_$HttpResultSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HttpResultErrorImplCopyWith<$Res>
    implements $HttpResultCopyWith<$Res> {
  factory _$$HttpResultErrorImplCopyWith(_$HttpResultErrorImpl value,
          $Res Function(_$HttpResultErrorImpl) then) =
      __$$HttpResultErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uri, HttpError error});

  $HttpErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$HttpResultErrorImplCopyWithImpl<$Res>
    extends _$HttpResultCopyWithImpl<$Res, _$HttpResultErrorImpl>
    implements _$$HttpResultErrorImplCopyWith<$Res> {
  __$$HttpResultErrorImplCopyWithImpl(
      _$HttpResultErrorImpl _value, $Res Function(_$HttpResultErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
    Object? error = null,
  }) {
    return _then(_$HttpResultErrorImpl(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as HttpError,
    ));
  }

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HttpErrorCopyWith<$Res> get error {
    return $HttpErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$HttpResultErrorImpl extends HttpResultError {
  const _$HttpResultErrorImpl({required this.uri, required this.error})
      : super._();

  @override
  final String uri;
  @override
  final HttpError error;

  @override
  String toString() {
    return 'HttpResult.error(uri: $uri, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpResultErrorImpl &&
            (identical(other.uri, uri) || other.uri == uri) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri, error);

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpResultErrorImplCopyWith<_$HttpResultErrorImpl> get copyWith =>
      __$$HttpResultErrorImplCopyWithImpl<_$HttpResultErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uri, String response, int statusCode)
        success,
    required TResult Function(String uri, HttpError error) error,
  }) {
    return error(uri, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String uri, String response, int statusCode)? success,
    TResult? Function(String uri, HttpError error)? error,
  }) {
    return error?.call(uri, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uri, String response, int statusCode)? success,
    TResult Function(String uri, HttpError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(uri, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpResultSuccess value) success,
    required TResult Function(HttpResultError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpResultSuccess value)? success,
    TResult? Function(HttpResultError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpResultSuccess value)? success,
    TResult Function(HttpResultError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class HttpResultError extends HttpResult {
  const factory HttpResultError(
      {required final String uri,
      required final HttpError error}) = _$HttpResultErrorImpl;
  const HttpResultError._() : super._();

  @override
  String get uri;
  HttpError get error;

  /// Create a copy of HttpResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpResultErrorImplCopyWith<_$HttpResultErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HttpError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function(String errorMessage) connectionFailed,
    required TResult Function(int statusCode, String response) retryLater,
    required TResult Function(int statusCode, String response) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function(String errorMessage)? connectionFailed,
    TResult? Function(int statusCode, String response)? retryLater,
    TResult? Function(int statusCode, String response)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function(String errorMessage)? connectionFailed,
    TResult Function(int statusCode, String response)? retryLater,
    TResult Function(int statusCode, String response)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpErrorTimeout value) timeout,
    required TResult Function(_HttpErrorNetworkError value) connectionFailed,
    required TResult Function(_HttpErrorServerBusy value) retryLater,
    required TResult Function(_HttpErrorUnknown value) unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpErrorTimeout value)? timeout,
    TResult? Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult? Function(_HttpErrorServerBusy value)? retryLater,
    TResult? Function(_HttpErrorUnknown value)? unknownError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpErrorTimeout value)? timeout,
    TResult Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult Function(_HttpErrorServerBusy value)? retryLater,
    TResult Function(_HttpErrorUnknown value)? unknownError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpErrorCopyWith<$Res> {
  factory $HttpErrorCopyWith(HttpError value, $Res Function(HttpError) then) =
      _$HttpErrorCopyWithImpl<$Res, HttpError>;
}

/// @nodoc
class _$HttpErrorCopyWithImpl<$Res, $Val extends HttpError>
    implements $HttpErrorCopyWith<$Res> {
  _$HttpErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$HttpErrorTimeoutImplCopyWith<$Res> {
  factory _$$HttpErrorTimeoutImplCopyWith(_$HttpErrorTimeoutImpl value,
          $Res Function(_$HttpErrorTimeoutImpl) then) =
      __$$HttpErrorTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpErrorTimeoutImplCopyWithImpl<$Res>
    extends _$HttpErrorCopyWithImpl<$Res, _$HttpErrorTimeoutImpl>
    implements _$$HttpErrorTimeoutImplCopyWith<$Res> {
  __$$HttpErrorTimeoutImplCopyWithImpl(_$HttpErrorTimeoutImpl _value,
      $Res Function(_$HttpErrorTimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HttpErrorTimeoutImpl extends _HttpErrorTimeout {
  const _$HttpErrorTimeoutImpl() : super._();

  @override
  String toString() {
    return 'HttpError.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HttpErrorTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function(String errorMessage) connectionFailed,
    required TResult Function(int statusCode, String response) retryLater,
    required TResult Function(int statusCode, String response) unknownError,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function(String errorMessage)? connectionFailed,
    TResult? Function(int statusCode, String response)? retryLater,
    TResult? Function(int statusCode, String response)? unknownError,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function(String errorMessage)? connectionFailed,
    TResult Function(int statusCode, String response)? retryLater,
    TResult Function(int statusCode, String response)? unknownError,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpErrorTimeout value) timeout,
    required TResult Function(_HttpErrorNetworkError value) connectionFailed,
    required TResult Function(_HttpErrorServerBusy value) retryLater,
    required TResult Function(_HttpErrorUnknown value) unknownError,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpErrorTimeout value)? timeout,
    TResult? Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult? Function(_HttpErrorServerBusy value)? retryLater,
    TResult? Function(_HttpErrorUnknown value)? unknownError,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpErrorTimeout value)? timeout,
    TResult Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult Function(_HttpErrorServerBusy value)? retryLater,
    TResult Function(_HttpErrorUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _HttpErrorTimeout extends HttpError {
  const factory _HttpErrorTimeout() = _$HttpErrorTimeoutImpl;
  const _HttpErrorTimeout._() : super._();
}

/// @nodoc
abstract class _$$HttpErrorNetworkErrorImplCopyWith<$Res> {
  factory _$$HttpErrorNetworkErrorImplCopyWith(
          _$HttpErrorNetworkErrorImpl value,
          $Res Function(_$HttpErrorNetworkErrorImpl) then) =
      __$$HttpErrorNetworkErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$HttpErrorNetworkErrorImplCopyWithImpl<$Res>
    extends _$HttpErrorCopyWithImpl<$Res, _$HttpErrorNetworkErrorImpl>
    implements _$$HttpErrorNetworkErrorImplCopyWith<$Res> {
  __$$HttpErrorNetworkErrorImplCopyWithImpl(_$HttpErrorNetworkErrorImpl _value,
      $Res Function(_$HttpErrorNetworkErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$HttpErrorNetworkErrorImpl(
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpErrorNetworkErrorImpl extends _HttpErrorNetworkError {
  const _$HttpErrorNetworkErrorImpl({required this.errorMessage}) : super._();

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'HttpError.connectionFailed(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpErrorNetworkErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpErrorNetworkErrorImplCopyWith<_$HttpErrorNetworkErrorImpl>
      get copyWith => __$$HttpErrorNetworkErrorImplCopyWithImpl<
          _$HttpErrorNetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function(String errorMessage) connectionFailed,
    required TResult Function(int statusCode, String response) retryLater,
    required TResult Function(int statusCode, String response) unknownError,
  }) {
    return connectionFailed(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function(String errorMessage)? connectionFailed,
    TResult? Function(int statusCode, String response)? retryLater,
    TResult? Function(int statusCode, String response)? unknownError,
  }) {
    return connectionFailed?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function(String errorMessage)? connectionFailed,
    TResult Function(int statusCode, String response)? retryLater,
    TResult Function(int statusCode, String response)? unknownError,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpErrorTimeout value) timeout,
    required TResult Function(_HttpErrorNetworkError value) connectionFailed,
    required TResult Function(_HttpErrorServerBusy value) retryLater,
    required TResult Function(_HttpErrorUnknown value) unknownError,
  }) {
    return connectionFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpErrorTimeout value)? timeout,
    TResult? Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult? Function(_HttpErrorServerBusy value)? retryLater,
    TResult? Function(_HttpErrorUnknown value)? unknownError,
  }) {
    return connectionFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpErrorTimeout value)? timeout,
    TResult Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult Function(_HttpErrorServerBusy value)? retryLater,
    TResult Function(_HttpErrorUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (connectionFailed != null) {
      return connectionFailed(this);
    }
    return orElse();
  }
}

abstract class _HttpErrorNetworkError extends HttpError {
  const factory _HttpErrorNetworkError({required final String errorMessage}) =
      _$HttpErrorNetworkErrorImpl;
  const _HttpErrorNetworkError._() : super._();

  String get errorMessage;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpErrorNetworkErrorImplCopyWith<_$HttpErrorNetworkErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HttpErrorServerBusyImplCopyWith<$Res> {
  factory _$$HttpErrorServerBusyImplCopyWith(_$HttpErrorServerBusyImpl value,
          $Res Function(_$HttpErrorServerBusyImpl) then) =
      __$$HttpErrorServerBusyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statusCode, String response});
}

/// @nodoc
class __$$HttpErrorServerBusyImplCopyWithImpl<$Res>
    extends _$HttpErrorCopyWithImpl<$Res, _$HttpErrorServerBusyImpl>
    implements _$$HttpErrorServerBusyImplCopyWith<$Res> {
  __$$HttpErrorServerBusyImplCopyWithImpl(_$HttpErrorServerBusyImpl _value,
      $Res Function(_$HttpErrorServerBusyImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? response = null,
  }) {
    return _then(_$HttpErrorServerBusyImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpErrorServerBusyImpl extends _HttpErrorServerBusy {
  const _$HttpErrorServerBusyImpl(
      {required this.statusCode, required this.response})
      : super._();

  @override
  final int statusCode;
  @override
  final String response;

  @override
  String toString() {
    return 'HttpError.retryLater(statusCode: $statusCode, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpErrorServerBusyImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, response);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpErrorServerBusyImplCopyWith<_$HttpErrorServerBusyImpl> get copyWith =>
      __$$HttpErrorServerBusyImplCopyWithImpl<_$HttpErrorServerBusyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function(String errorMessage) connectionFailed,
    required TResult Function(int statusCode, String response) retryLater,
    required TResult Function(int statusCode, String response) unknownError,
  }) {
    return retryLater(statusCode, response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function(String errorMessage)? connectionFailed,
    TResult? Function(int statusCode, String response)? retryLater,
    TResult? Function(int statusCode, String response)? unknownError,
  }) {
    return retryLater?.call(statusCode, response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function(String errorMessage)? connectionFailed,
    TResult Function(int statusCode, String response)? retryLater,
    TResult Function(int statusCode, String response)? unknownError,
    required TResult orElse(),
  }) {
    if (retryLater != null) {
      return retryLater(statusCode, response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpErrorTimeout value) timeout,
    required TResult Function(_HttpErrorNetworkError value) connectionFailed,
    required TResult Function(_HttpErrorServerBusy value) retryLater,
    required TResult Function(_HttpErrorUnknown value) unknownError,
  }) {
    return retryLater(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpErrorTimeout value)? timeout,
    TResult? Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult? Function(_HttpErrorServerBusy value)? retryLater,
    TResult? Function(_HttpErrorUnknown value)? unknownError,
  }) {
    return retryLater?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpErrorTimeout value)? timeout,
    TResult Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult Function(_HttpErrorServerBusy value)? retryLater,
    TResult Function(_HttpErrorUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (retryLater != null) {
      return retryLater(this);
    }
    return orElse();
  }
}

abstract class _HttpErrorServerBusy extends HttpError {
  const factory _HttpErrorServerBusy(
      {required final int statusCode,
      required final String response}) = _$HttpErrorServerBusyImpl;
  const _HttpErrorServerBusy._() : super._();

  int get statusCode;
  String get response;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpErrorServerBusyImplCopyWith<_$HttpErrorServerBusyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HttpErrorUnknownImplCopyWith<$Res> {
  factory _$$HttpErrorUnknownImplCopyWith(_$HttpErrorUnknownImpl value,
          $Res Function(_$HttpErrorUnknownImpl) then) =
      __$$HttpErrorUnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statusCode, String response});
}

/// @nodoc
class __$$HttpErrorUnknownImplCopyWithImpl<$Res>
    extends _$HttpErrorCopyWithImpl<$Res, _$HttpErrorUnknownImpl>
    implements _$$HttpErrorUnknownImplCopyWith<$Res> {
  __$$HttpErrorUnknownImplCopyWithImpl(_$HttpErrorUnknownImpl _value,
      $Res Function(_$HttpErrorUnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? response = null,
  }) {
    return _then(_$HttpErrorUnknownImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HttpErrorUnknownImpl extends _HttpErrorUnknown {
  const _$HttpErrorUnknownImpl(
      {required this.statusCode, required this.response})
      : super._();

  @override
  final int statusCode;
  @override
  final String response;

  @override
  String toString() {
    return 'HttpError.unknownError(statusCode: $statusCode, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpErrorUnknownImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusCode, response);

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HttpErrorUnknownImplCopyWith<_$HttpErrorUnknownImpl> get copyWith =>
      __$$HttpErrorUnknownImplCopyWithImpl<_$HttpErrorUnknownImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function(String errorMessage) connectionFailed,
    required TResult Function(int statusCode, String response) retryLater,
    required TResult Function(int statusCode, String response) unknownError,
  }) {
    return unknownError(statusCode, response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function(String errorMessage)? connectionFailed,
    TResult? Function(int statusCode, String response)? retryLater,
    TResult? Function(int statusCode, String response)? unknownError,
  }) {
    return unknownError?.call(statusCode, response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function(String errorMessage)? connectionFailed,
    TResult Function(int statusCode, String response)? retryLater,
    TResult Function(int statusCode, String response)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(statusCode, response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_HttpErrorTimeout value) timeout,
    required TResult Function(_HttpErrorNetworkError value) connectionFailed,
    required TResult Function(_HttpErrorServerBusy value) retryLater,
    required TResult Function(_HttpErrorUnknown value) unknownError,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_HttpErrorTimeout value)? timeout,
    TResult? Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult? Function(_HttpErrorServerBusy value)? retryLater,
    TResult? Function(_HttpErrorUnknown value)? unknownError,
  }) {
    return unknownError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_HttpErrorTimeout value)? timeout,
    TResult Function(_HttpErrorNetworkError value)? connectionFailed,
    TResult Function(_HttpErrorServerBusy value)? retryLater,
    TResult Function(_HttpErrorUnknown value)? unknownError,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _HttpErrorUnknown extends HttpError {
  const factory _HttpErrorUnknown(
      {required final int statusCode,
      required final String response}) = _$HttpErrorUnknownImpl;
  const _HttpErrorUnknown._() : super._();

  int get statusCode;
  String get response;

  /// Create a copy of HttpError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HttpErrorUnknownImplCopyWith<_$HttpErrorUnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
