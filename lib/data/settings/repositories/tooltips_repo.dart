import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/tooltip_type.dart';
import '../../../services/unauth_prefs_service.dart';

part 'tooltips_repo.g.dart';

@riverpod
TooltipsRepo tooltipsRepo(Ref ref) => TooltipsRepo(ref.read(unauthPrefsServiceProvider));

class TooltipsRepo {
  final UnauthPrefsService _prefs;
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
