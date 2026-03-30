import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'logger.g.dart';

@riverpod
Logger logger(Ref ref, String source) {
  return Logger._(source);
}

/// A span used for performance tracing purposes

abstract class Span {
  void setError(dynamic error);

  Span startChildSpan(String operation, String? description);

  Future<void> finish();
}

class _SentrySpan implements Span {
  final ISentrySpan _sentrySpan;

  _SentrySpan(this._sentrySpan);

  @override
  void setError(dynamic error) {
    _sentrySpan.throwable = error;
    _sentrySpan.status = SpanStatus.internalError();
  }

  @override
  Span startChildSpan(String operation, String? description) {
    return _SentrySpan(_sentrySpan.startChild(operation, description: description));
  }

  @override
  Future<void> finish() {
    return _sentrySpan.finish();
  }
}

class _LocalSpan implements Span {
  final String source;
  final String operation;
  final String? description;
  late final DateTime startTime;

  _LocalSpan({
    required this.source,
    required this.operation,
    this.description,
  }) {
    startTime = DateTime.now();
  }

  @override
  void setError(dynamic error) {
    // No-op
  }

  @override
  Span startChildSpan(String operation, [String? description]) {
    return _LocalSpan(source: source, operation: operation, description: description);
  }

  @override
  Future<void> finish() async {
    if (kDebugMode) {
      final now = DateTime.now();
      final elapsedMs = now.difference(startTime).inMilliseconds;
      final message = '$source:$operation${description != null ? ' ($description)' : ''}';
      print('[QSLog-Perf] $message took ${elapsedMs}ms');
    }
  }
}

class Logger {
  final String source;
  Logger._(this.source);

  static const bool logToSentry = kReleaseMode || bool.fromEnvironment('ENABLE_SENTRY_LOGGING');

  void log(String message, {List<String> params = const [], LogLevel level = LogLevel.info}) {
    final attributes = <String, SentryAttribute>{'source': SentryAttribute.string(source)};
    if (logToSentry) {
      switch (level) {
        case LogLevel.trace:
          Sentry.logger.fmt.trace(message, params, attributes: attributes);
        case LogLevel.debug:
          Sentry.logger.fmt.debug(message, params, attributes: attributes);
        case LogLevel.info:
          Sentry.logger.fmt.info(message, params, attributes: attributes);
        case LogLevel.warning:
          Sentry.logger.fmt.warn(message, params, attributes: attributes);
        case LogLevel.error:
          Sentry.logger.fmt.error(message, params, attributes: attributes);
        case LogLevel.fatal:
          Sentry.logger.fmt.fatal(message, params, attributes: attributes);
      }
    } else if (kDebugMode) {
      print('[QSLog-$level] $source: $message${params.isNotEmpty ? '. Params: $params' : ''}');
    }
  }

  /// Capture a span of time for performance analysis
  Span startSpan(String operation, [String? description]) {
    if (logToSentry) {
      final sentrySpan = Sentry.startTransaction(source, operation, description: description);
      return _SentrySpan(sentrySpan);
    } else {
      return _LocalSpan(source: source, operation: operation, description: description);
    }
  }
}

enum LogLevel { trace, debug, info, warning, error, fatal }
