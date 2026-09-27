import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_service.dart';
import 'shared_preferences.dart';

part 'user_prefs_service.g.dart';

@Riverpod(keepAlive: true)
UserPrefsService userPrefsService(Ref ref) => UserPrefsService(ref);

/// Preferences which belong to the signed in user, such as values describing the contents of their
/// local database. Each user has their own set of values, stored by prefixing keys with the user ID.
///
/// The user is looked up on every call, so values always belong to whoever is signed in at the time.
/// While nobody is signed in, values are stored for an `unauthenticated` user, matching the database
/// provided by `appDatabaseProvider`.
///
/// Use [UnauthPrefsService] for values which apply to the whole device.
class UserPrefsService {
  UserPrefsService(this._ref);

  final Ref _ref;

  String _key(String key) {
    final userId = _ref.read(userIdProvider) ?? 'unauthenticated';
    return '$userId/$key';
  }

  String? getString(String key) => _ref.read(sharedPrefsProvider).getString(_key(key));

  Future<void> setString(String key, String value) => _ref.read(sharedPrefsProvider).setString(_key(key), value);

  bool? getBool(String key) => _ref.read(sharedPrefsProvider).getBool(_key(key));

  Future<void> setBool(String key, bool value) => _ref.read(sharedPrefsProvider).setBool(_key(key), value);

  int? getInt(String key) => _ref.read(sharedPrefsProvider).getInt(_key(key));

  Future<void> setInt(String key, int value) => _ref.read(sharedPrefsProvider).setInt(_key(key), value);

  Future<void> remove(String key) => _ref.read(sharedPrefsProvider).remove(_key(key));
}
