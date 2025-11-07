import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/settings.dart';
import '../services/shared_preferences.dart';

part 'settings_repo.g.dart';

@Riverpod(keepAlive: true)
SettingsRepo settingsRepo(Ref ref) => SettingsRepo(ref.read(sharedPrefsProvider));

class SettingsRepo {
  final SharedPreferencesWithCache _prefs;
  SettingsRepo(this._prefs);

  final String _themeModeKey = 'themeMode';

  Settings getSettings() {
    return Settings(
      themeMode: _parseThemeMode(_prefs.getString(_themeModeKey)),
    );
  }

  ThemeMode _parseThemeMode(String? themeModeName) {
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeModeName,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> updateThemeMode(ThemeMode themeMode) {
    return _prefs.setString(_themeModeKey, themeMode.name);
  }
}
