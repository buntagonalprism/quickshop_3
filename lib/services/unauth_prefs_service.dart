import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'unauth_prefs_service.g.dart';

// SharedPreferencesWithCache needs async initialisation, so main.dart creates the service and
// overrides this provider.
@Riverpod(keepAlive: true)
UnauthPrefsService unauthPrefsService(Ref ref) {
  throw UnimplementedError('Initialised in main.dart');
}

/// Preferences which apply to the whole device regardless of who is signed in, such as the theme or
/// whether the location permission rationale has been shown.
///
/// Use [UserPrefsService] for values which belong to the signed in user.
class UnauthPrefsService {
  UnauthPrefsService(this._prefs);

  final SharedPreferencesWithCache _prefs;

  String? getString(String key) => _prefs.getString(key);

  Future<void> setString(String key, String value) => _prefs.setString(key, value);

  bool? getBool(String key) => _prefs.getBool(key);

  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  int? getInt(String key) => _prefs.getInt(key);

  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<void> remove(String key) => _prefs.remove(key);
}
