import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'app.dart';
import 'firebase/options.dart';
import 'services/shared_preferences.dart';
import 'services/sqlite_db.dart';

Future<void> main() async {
  // Only initalise sentry in release mode
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        // The Sentry DSN is set via the SENTRY_DSN variable in app_secrets_<env>.json

        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: _main,
    );
  } else {
    WidgetsFlutterBinding.ensureInitialized();
    await _main();
  }
}

Future<void> _main() async {
  final prefsFuture = SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(),
  );
  final dbFuture = openDatabase();
  final initResults = await Future.wait([prefsFuture, dbFuture]);
  final prefs = initResults[0] as SharedPreferencesWithCache;
  final db = initResults[1] as sqflite.Database;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
      clientId: DefaultFirebaseOptions.googleSignInClientId,
    ),
  ]);
  runApp(ProviderScope(
    overrides: [
      sharedPrefsProvider.overrideWithValue(prefs),
      sqfliteDbProvider.overrideWithValue(db),
    ],
    child: const MyApp(),
  ));
}
