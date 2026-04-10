import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/location_service.dart';

/// Dialog that explains why location permission is needed and asks the user
/// to allow it. Returns true if the user agreed to grant permission.
class LocationRationaleDialog extends StatelessWidget {
  const LocationRationaleDialog._();

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => const LocationRationaleDialog._(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Location access'),
      content: const Text(
        'QuickShop uses your location to find nearby stores',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Not now'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Allow'),
        ),
      ],
    );
  }
}

/// Dialog shown when location permissions are permanently denied. Offers a
/// button to open the device app settings so the user can grant permission.
/// Monitors app lifecycle: if the user grants permission in settings and
/// returns, the dialog pops automatically and returns `true`.
/// Returns `false` if the user cancels without granting permission.
class LocationPermissionDeniedDialog extends ConsumerStatefulWidget {
  const LocationPermissionDeniedDialog._();

  static Future<bool> show(BuildContext context) async {
    if (!context.mounted) return false;
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LocationPermissionDeniedDialog._(),
    );
    return result ?? false;
  }

  @override
  ConsumerState<LocationPermissionDeniedDialog> createState() => _LocationPermissionDeniedDialogState();
}

class _LocationPermissionDeniedDialogState extends ConsumerState<LocationPermissionDeniedDialog>
    with WidgetsBindingObserver {
  bool didOpenSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (didOpenSettings) {
        Navigator.of(context).pop(true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Location access required'),
      content: const Text(
        'Location permissions are required to use this feature. '
        'You can manage permissions in your device settings.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            didOpenSettings = true;
            ref.read(locationServiceProvider).openAppSettings();
          },
          child: const Text('Open Settings'),
        ),
      ],
    );
  }
}
