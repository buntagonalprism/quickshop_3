import 'package:shared_preferences/shared_preferences.dart';

class FakeSharedPreferences implements SharedPreferencesWithCache {
  final Map<String, Object> _storage = {};

  @override
  Future<void> clear() async {
    _storage.clear();
  }

  @override
  bool containsKey(String key) {
    return _storage.containsKey(key);
  }

  @override
  Object? get(String key) {
    return _storage[key];
  }

  @override
  bool? getBool(String key) {
    final value = _storage[key];
    return value is bool ? value : null;
  }

  @override
  double? getDouble(String key) {
    final value = _storage[key];
    return value is double ? value : null;
  }

  @override
  int? getInt(String key) {
    final value = _storage[key];
    return value is int ? value : null;
  }

  @override
  String? getString(String key) {
    final value = _storage[key];
    return value is String ? value : null;
  }

  @override
  List<String>? getStringList(String key) {
    final value = _storage[key];
    return value is List<String> ? value : null;
  }

  @override
  Set<String> get keys => _storage.keys.toSet();

  @override
  Future<void> reloadCache() async {
    // No-op for fake implementation since we're using in-memory storage
  }

  @override
  Future<void> remove(String key) async {
    _storage.remove(key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    _storage[key] = value;
  }

  @override
  Future<void> setDouble(String key, double value) async {
    _storage[key] = value;
  }

  @override
  Future<void> setInt(String key, int value) async {
    _storage[key] = value;
  }

  @override
  Future<void> setString(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    _storage[key] = List<String>.from(value); // Create a copy to avoid external modifications
  }
}
