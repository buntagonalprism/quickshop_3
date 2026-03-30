import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marionette_flutter/marionette_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'analytics/logger.dart';
import 'app.dart';
import 'services/firebase/options.dart';
import 'services/settings_service.dart';
import 'services/shared_preferences.dart';

Future<void> main() async {
  // Only initalise sentry in release mode
  if (Logger.logToSentry) {
    await SentryFlutter.init(
      (options) {
        // The Sentry DSN is set via the SENTRY_DSN variable in app_secrets_<env>.json

        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;

        // Enable sending log messages to Sentry
        options.enableLogs = true;
      },
      appRunner: _main,
    );
  } else {
    MarionetteBinding.ensureInitialized();
    await _main();
  }
}

Future<void> _main() async {
  final (prefs, settings) = await (
    SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions()),
    SettingsService.init(),
  ).wait;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
      clientId: DefaultFirebaseOptions.googleSignInClientId,
    ),
  ]);
  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        settingsServiceProvider.overrideWithValue(settings),
      ],
      child: const MyApp(),
    ),
  );
}
