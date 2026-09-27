import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';

part 'shared_preferences.g.dart';

// SharedPreferencesWithCache needs async initialisation to load data from disk into the cache.
// This provider will be overridden in main.dart with the actual shared preferences instance.
@Riverpod(keepAlive: true)
SharedPreferencesWithCache sharedPrefs(Ref ref) {
  throw UnimplementedError();
}

/// Shared preferences scoped to the signed in user, for values which should differ between users on
/// the same device. Use [sharedPrefsProvider] for values which apply to the whole device.
@Riverpod(keepAlive: true)
UserSharedPreferences userSharedPrefs(Ref ref) {
  final userId = ref.watch(userIdProvider) ?? 'unauthenticated';
  return UserSharedPreferences(ref.watch(sharedPrefsProvider), userId);
}

/// Wraps [SharedPreferencesWithCache] to prefix all keys with a user ID, so each user has their own
/// set of values.
class UserSharedPreferences {
  UserSharedPreferences(this._prefs, this._userId);

  final SharedPreferencesWithCache _prefs;
  final String _userId;

  String _key(String key) => '$_userId/$key';

  String? getString(String key) => _prefs.getString(_key(key));

  Future<void> setString(String key, String value) => _prefs.setString(_key(key), value);

  bool? getBool(String key) => _prefs.getBool(_key(key));

  Future<void> setBool(String key, bool value) => _prefs.setBool(_key(key), value);

  int? getInt(String key) => _prefs.getInt(_key(key));

  Future<void> setInt(String key, int value) => _prefs.setInt(_key(key), value);

  Future<void> remove(String key) => _prefs.remove(_key(key));
}
