import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/settings.dart';
import '../../../services/unauth_prefs_service.dart';

part 'settings_repo.g.dart';

@Riverpod(keepAlive: true)
SettingsRepo settingsRepo(Ref ref) => SettingsRepo(ref.read(unauthPrefsServiceProvider));

class SettingsRepo {
  final UnauthPrefsService _prefs;
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
