import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

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
class LocationPermissionDeniedDialog extends StatelessWidget {
  const LocationPermissionDeniedDialog._();

  static Future<void> show(BuildContext context) async {
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => const LocationPermissionDeniedDialog._(),
    );
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Geolocator.openAppSettings();
          },
          child: const Text('Open Settings'),
        ),
      ],
    );
  }
}
