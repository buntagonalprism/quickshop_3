import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../analytics/crash_reporter.dart';
import 'http_result.dart';
import 'settings_service.dart';
import 'user_token_service.dart';

part 'functions_http_client.g.dart';

@Riverpod(keepAlive: true)
FunctionsHttpClient functionsHttpClient(Ref ref) {
  return FunctionsHttpClient(ref);
}

/// A client for making requests to HTTP-Triggered Firebase Functions in the Quickshop project.
/// This client adds necessary authentication headers to requests, and logs non-success responses:
/// - [HttpResultStatus.connectionError], [HttpResultStatus.retryableError] represent temporary
///   network errors that may be retried. These are logged to analytics for monitoring.
/// - [HttpResultStatus.unknownError] represents an unexpected error that is reported to Sentry.
class FunctionsHttpClient {
  FunctionsHttpClient(this.ref) {
    final settings = ref.read(settingsServiceProvider);
    if (settings.localBackendEnabled) {
      final emulator = _functionsEmulatorSettings;
      // The Firebase emulator includes the Firebase project ID and region in the URL path:
      // https://firebase.google.com/docs/functions/local-emulator#instrument_your_app_for_https_functions_emulation
      basePath = 'http://${settings.localBackendHost}:${emulator.port}/${emulator.project}/${emulator.region}';
    } else {
      basePath = const String.fromEnvironment('QUICKSHOP_FUNCTIONS_URL');
    }
  }

  final Ref ref;
  Analytics get analytics => ref.read(analyticsProvider);
  CrashReporter get crashReporter => ref.read(crashReporterProvider);

  late final String basePath;

  final Duration timeout = const Duration(seconds: 5);

  final int retries = 3;

  /// [path] is the path to the function, e.g. '/acceptListInvite'.
  Future<HttpResult> post(String path, Map<String, dynamic> data) async {
    return _getResult(method: _Method.post, path: path, data: jsonEncode(data));
  }

  Future<HttpResult> put(String path, [Map<String, dynamic>? data]) async {
    return _getResult(method: _Method.put, path: path, data: data != null ? jsonEncode(data) : null);
  }

  Future<HttpResult> _getResult({required _Method method, required String path, dynamic data}) async {
    final uri = Uri.parse(basePath + path);
    final headers = await _buildHeaders();
    final client = _buildClient(uri);
    try {
      final request = switch (method) {
        _Method.post => client.post(uri, body: data, headers: headers),
        _Method.put => client.put(uri, body: data, headers: headers),
        _Method.get => client.get(uri, headers: headers),
      };
      final response = await request.timeout(timeout);

      // Return success results
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return HttpResult.success(uri: uri.toString(), response: response.body, statusCode: response.statusCode);
      }

      // Log retryable errors to analytics
      if (const {429, 503}.contains(response.statusCode)) {
        return HttpResult.error(
          uri: uri.toString(),
          error: HttpError.retryLater(statusCode: response.statusCode, response: response.body),
        );
      }

      // Report other errors to analytics and to Sentry for debugging
      crashReporter.report(
        Exception(
          'Unknown error from HTTP Triggered Function. Uri: $uri. Status code: ${response.statusCode}. Response: ${response.body}',
        ),
        StackTrace.current,
      );
      final event = AnalyticsEvent.httpConnectionError(
        uri: uri.toString(),
        statusCode: response.statusCode,
        errorMessage: response.body,
      );
      analytics.logEvent(event);

      return HttpResult.error(
        uri: uri.toString(),
        error: HttpError.unknownError(statusCode: response.statusCode, response: response.body),
      );
    }
    // Log timeouts to analytics
    on TimeoutException catch (_) {
      final event = AnalyticsEvent.httpConnectionError(
        uri: uri.toString(),
        statusCode: 408,
        errorMessage: 'Request not completed within $timeout timeout out after $retries retries',
      );
      analytics.logEvent(event);
      return HttpResult.error(uri: uri.toString(), error: const HttpError.timeout());
    }
    // Log connection failures to analytics
    on SocketException catch (e) {
      final event = AnalyticsEvent.httpConnectionError(
        uri: uri.toString(),
        statusCode: connectionErrorStatusCode,
        errorMessage: e.message,
      );
      analytics.logEvent(event);
      return HttpResult.error(
        uri: uri.toString(),
        error: HttpError.connectionFailed(errorMessage: e.message),
      );
    }
    // Log other unexpected errors to analytics and to Sentry for debugging
    catch (e, t) {
      crashReporter.report(e, t);
      final event = AnalyticsEvent.httpConnectionError(
        uri: uri.toString(),
        statusCode: connectionErrorStatusCode,
        errorMessage: e.toString(),
      );
      analytics.logEvent(event);
      return HttpResult.error(
        uri: uri.toString(),
        error: HttpError.unknownError(statusCode: connectionErrorStatusCode, response: e.toString()),
      );
    }
  }

  RetryClient _buildClient(Uri uri) {
    return RetryClient(
      http.Client(),
      retries: retries,
      when: (response) {
        if (const {429, 503}.contains(response.statusCode)) {
          _logHttpRetry(uri, '${response.statusCode} response from functions');
          return true;
        }
        return false;
      },
      whenError: (error, _) {
        if (error is SocketException) {
          _logHttpRetry(uri, 'SocketException: ${error.message}');
          return true;
        } else if (error is TimeoutException) {
          _logHttpRetry(uri, 'TimeoutException: ${error.message}');
          return true;
        }
        return false;
      },
    );
  }

  void _logHttpRetry(Uri uri, String reason) {
    return analytics.logEvent(AnalyticsEvent.httpRetry(uri: uri.toString(), reason: reason));
  }

  Future<Map<String, String>> _buildHeaders() async {
    final headers = <String, String>{'Content-Type': 'application/json'};
    final token = await ref.read(userTokenServiceProvider).getToken();
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }
}

enum _Method {
  post,
  put,
  get,
}

const _functionsEmulatorSettings = (port: 5001, project: 'quickshop-dev', region: 'australia-southeast1');
