import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quickshop/repositories/user_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'crash_reporter.g.dart';

@riverpod
CrashReporter crashReporter(Ref ref) {
  ref.listen(
    userProvider,
    (_, user) {
      if (user != null) {
        Sentry.configureScope((scope) {
          scope.setUser(SentryUser(id: user.id, email: user.email));
        });
      } else {
        Sentry.configureScope((scope) => scope.setUser(null));
      }
    },
    fireImmediately: true,
  );

  return CrashReporter._();
}

class CrashReporter {
  CrashReporter._();

  void report(dynamic error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
      print(stackTrace);
    } else {
      Sentry.captureException(error, stackTrace: stackTrace);
    }
  }
}
