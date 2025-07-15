import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_result.freezed.dart';

@freezed
abstract class HttpResult with _$HttpResult {
  const HttpResult._();

  const factory HttpResult.success({
    required String uri,
    required String response,
    required int statusCode,
  }) = HttpResultSuccess;

  const factory HttpResult.error({
    required String uri,
    required HttpError error,
  }) = HttpResultError;
}

@freezed
class HttpError with _$HttpError {
  const HttpError._();

  /// The request failed because the target server did not respond within the specified timeout.
  /// A retry may succeed.
  const factory HttpError.timeout() = _HttpErrorTimeout;

  /// The request failed because the target server could not be reached. A retry may succeed once
  /// the client device regains network connectivity.
  const factory HttpError.connectionFailed({
    required String errorMessage,
  }) = _HttpErrorNetworkError;

  /// The request failed, with a status code response indicating a future request may succeed, e.g.
  /// due to rate limiting, server maintenance, or traffic overload.
  /// Http Status Codes 429, 503
  const factory HttpError.retryLater({
    required int statusCode,
    required String response,
  }) = _HttpErrorServerBusy;

  /// The request failed with a status code that does not indicate a retry would succeed - most
  /// likely due to either a malformed client request or a server-side error. Either way, the error
  /// should be reported and investigated for bug fixes. A retry is unlikely to succeed.
  const factory HttpError.unknownError({
    required int statusCode,
    required String response,
  }) = _HttpErrorUnknown;
}

const int connectionErrorStatusCode = -1;

enum HttpResultStatus {
  /// A success status code was received from the server
  /// Http Status Codes 200-299
  success,

  /// The request failed because the target server could not be reached. A retry may succeed once
  /// the client device regains network connectivity.
  /// Http Status Code -1
  connectionError,

  /// The request failed, with a status code response indicating a future request may succeed, e.g.
  /// due to rate limiting, server maintenance, or traffic overload.
  /// Http Status Codes 429, 502, 503, 504
  retryableError,

  /// The request failed with a status code that does not indicate a retry would succeed - most
  /// likely due to either a malformed client request or a server-side error. Either way, the error
  /// should be reported and investigated for bug fixes. A retry is unlikely to succeed.
  unknownError,
}
