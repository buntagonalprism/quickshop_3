import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/settings_notifier.dart';
import '../../services/package_info.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.light_mode),
            title: const Text('Display theme'),
            trailing: DropdownButton<ThemeMode>(
              value: settings.themeMode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(settingsNotifierProvider.notifier).updateThemeMode(value);
                }
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark'),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Consumer(builder: (context, ref, _) {
              final versionAsync = ref.watch(packageInfoProvider);
              if (versionAsync.isLoading) return const CircularProgressIndicator();
              final version = versionAsync.requireValue;
              return Text('Version: ${version.version}+${version.buildNumber}');
            }),
          ),
          ElevatedButton(
            onPressed: () {
              throw Exception('This is test exception');
            },
            child: const Text('Verify Sentry Setup'),
          ),
        ],
      ),
    );
  }
}
