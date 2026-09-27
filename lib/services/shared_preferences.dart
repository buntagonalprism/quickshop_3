import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences.g.dart';

// SharedPreferencesWithCache needs async initialisation to load data from disk into the cache.
// This provider will be overridden in main.dart with the actual shared preferences instance.
//
// Only UserPrefsService and UnauthPrefsService should use this provider directly. Everything else
// should use one of those, depending on whether the value belongs to the signed in user or to the
// device.
@Riverpod(keepAlive: true)
SharedPreferencesWithCache sharedPrefs(Ref ref) {
  throw UnimplementedError();
}
