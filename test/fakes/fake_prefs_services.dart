import 'package:quickshop/services/unauth_prefs_service.dart';
import 'package:quickshop/services/user_prefs_service.dart';

/// An in-memory [UserPrefsService] for the signed in user.
class FakeUserPrefsService with _InMemoryPrefs implements UserPrefsService {}

/// An in-memory [UnauthPrefsService].
class FakeUnauthPrefsService with _InMemoryPrefs implements UnauthPrefsService {}

mixin _InMemoryPrefs {
  final Map<String, Object> values = {};

  String? getString(String key) => values[key] as String?;

  Future<void> setString(String key, String value) async => values[key] = value;

  bool? getBool(String key) => values[key] as bool?;

  Future<void> setBool(String key, bool value) async => values[key] = value;

  int? getInt(String key) => values[key] as int?;

  Future<void> setInt(String key, int value) async => values[key] = value;

  Future<void> remove(String key) async => values.remove(key);
}
