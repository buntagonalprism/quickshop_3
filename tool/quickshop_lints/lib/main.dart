import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

import 'src/avoid_datetime_now.dart';

/// The analysis server imports this library and loads the plugin from this variable.
final plugin = QuickshopLintsPlugin();

class QuickshopLintsPlugin extends Plugin {
  @override
  String get name => 'quickshop_lints';

  @override
  void register(PluginRegistry registry) {
    registry.registerLintRule(AvoidDateTimeNow());
  }
}
