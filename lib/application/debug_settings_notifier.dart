import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_settings_notifier.g.dart';

enum DebugSetting {
  showSortKeys,
}

@Riverpod(keepAlive: true)
class DebugSettingsNotifier extends _$DebugSettingsNotifier {
  @override
  bool build(DebugSetting type) {
    return false;
  }

  void toggle() {
    state = !state;
  }
}
