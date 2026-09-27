import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'shared_preferences.dart';

part 'unauth_prefs_service.g.dart';

@Riverpod(keepAlive: true)
UnauthPrefsService unauthPrefsService(Ref ref) => UnauthPrefsService(ref);

/// Preferences which apply to the whole device regardless of who is signed in, such as the theme or
/// whether the location permission rationale has been shown.
///
/// Use [UserPrefsService] for values which belong to the signed in user.
class UnauthPrefsService {
  UnauthPrefsService(this._ref);

  final Ref _ref;

  String? getString(String key) => _ref.read(sharedPrefsProvider).getString(key);

  Future<void> setString(String key, String value) => _ref.read(sharedPrefsProvider).setString(key, value);

  bool? getBool(String key) => _ref.read(sharedPrefsProvider).getBool(key);

  Future<void> setBool(String key, bool value) => _ref.read(sharedPrefsProvider).setBool(key, value);

  int? getInt(String key) => _ref.read(sharedPrefsProvider).getInt(key);

  Future<void> setInt(String key, int value) => _ref.read(sharedPrefsProvider).setInt(key, value);

  Future<void> remove(String key) => _ref.read(sharedPrefsProvider).remove(key);
}
