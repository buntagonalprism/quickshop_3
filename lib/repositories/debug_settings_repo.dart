import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_settings_repo.g.dart';

enum DebugSetting {
  showSortKeys,
}

@Riverpod(keepAlive: true)
class DebugSettingsRepo extends _$DebugSettingsRepo {
  @override
  bool build(DebugSetting type) {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
