import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_service.dart';

part 'user_prefs_service.g.dart';

// SharedPreferencesWithCache needs async initialisation, so main.dart creates the service and
// overrides this provider.
@Riverpod(keepAlive: true)
UserPrefsService userPrefsService(Ref ref) {
  throw UnimplementedError('Initialised in main.dart');
}

/// Preferences which belong to the signed in user, such as values describing the contents of their
/// local database. Each user has their own set of values, stored by prefixing keys with the user ID.
///
/// The user is looked up on every call, so values always belong to whoever is signed in at the time.
/// While nobody is signed in, values are stored for an `unauthenticated` user, matching the database
/// provided by `appDatabaseProvider`.
///
/// Use [UnauthPrefsService] for values which apply to the whole device.
class UserPrefsService {
  UserPrefsService(this._ref, this._prefs);

  final Ref _ref;
  final SharedPreferencesWithCache _prefs;

  String _key(String key) {
    final userId = _ref.read(userIdProvider) ?? 'unauthenticated';
    return '$userId/$key';
  }

  String? getString(String key) => _prefs.getString(_key(key));

  Future<void> setString(String key, String value) => _prefs.setString(_key(key), value);

  bool? getBool(String key) => _prefs.getBool(_key(key));

  Future<void> setBool(String key, bool value) => _prefs.setBool(_key(key), value);

  int? getInt(String key) => _prefs.getInt(_key(key));

  Future<void> setInt(String key, int value) => _prefs.setInt(_key(key), value);

  Future<void> remove(String key) => _prefs.remove(_key(key));
}
