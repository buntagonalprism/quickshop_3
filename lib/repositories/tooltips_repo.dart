import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/tooltip_type.dart';
import '../services/shared_preferences.dart';

part 'tooltips_repo.g.dart';

@riverpod
TooltipsRepo tooltipsRepo(Ref ref) => TooltipsRepo(ref.read(sharedPrefsProvider));

class TooltipsRepo {
  final SharedPreferencesWithCache _prefs;
  TooltipsRepo(this._prefs);

  bool get(TooltipType type) {
    return _prefs.getBool(type.keyName) ?? true;
  }

  Future<void> setDisplayTooltip(TooltipType type, bool value) {
    return _prefs.setBool(type.keyName, value);
  }
}

extension on TooltipType {
  String get keyName => 'tooltips.$name';
}
