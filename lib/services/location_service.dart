import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/common/models/coordinates.dart';
import '../widgets/location_dialogs.dart';
import 'shared_preferences.dart';

part 'location_service.g.dart';

/// - `true` when location can be obtained or permission can be requested for the first time. We only request permission
///   once to avoid annoying users who do not wish to use location features.
/// - `false` when location permissions have already been requested and denied. The UI should indicate that location
///   features are unavailable. Only if the user then interacts with a location-specific action or location-disabled
///   message should the UI call getLocationWithPermissionRequest to enable location.
@Riverpod(keepAlive: true)
bool canGetOrAutoRequestLocation(Ref ref) {
  final status = ref.watch(_locationStatusProvider);
  return status == LocationStatus.granted || status == LocationStatus.deniedNotRequested;
}

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) => LocationService(ref);

class LocationService {
  final Ref _ref;
  LocationService(this._ref);

  /// Attempts to get the device's current location, showing appropriate dialogs
  /// based on the current [LocationStatus]:
  ///
  /// - [LocationStatus.granted]: Gets and returns location directly.
  /// - [LocationStatus.deniedNotRequested]: Shows [LocationRationaleDialog],
  ///   then requests permission if agreed. Returns location if granted.
  /// - [LocationStatus.deniedForever]: Shows [LocationPermissionDeniedDialog]
  ///   so the user can open settings. Pops automatically when permission is
  ///   granted on app resume. Returns location if granted.
  /// - [LocationStatus.deniedRequested]: Directly calls [_requestPermission]
  ///   (rationale was already shown). Returns location if granted.
  ///
  /// Returns `null` if location could not be obtained.
  Future<Coordinates?> getLocationWithPermissionRequest(
    BuildContext context,
  ) async {
    LocationStatus status = _ref.read(_locationStatusProvider);
    final statusNotifier = _ref.read(_locationStatusProvider.notifier);

    switch (status) {
      case LocationStatus.granted:
        return _getCurrentLocation();

      case LocationStatus.deniedNotRequested:
        if (!context.mounted) return null;
        final agreed = await LocationRationaleDialog.show(context);
        statusNotifier._onRationaleShown(agreed);

        if (!agreed || !context.mounted) return null;

        final result = await _requestPermission();
        status = statusNotifier._applyPermission(result);
        if (status == LocationStatus.granted) {
          return _getCurrentLocation();
        }
        return null;

      case LocationStatus.deniedForever:
        if (!context.mounted) return null;
        final openedSettings = await LocationPermissionDeniedDialog.show(context);
        if (!openedSettings || !context.mounted) return null;
        // Confirm if the user did grant permission via settings.
        status = await statusNotifier._refresh();
        if (status == LocationStatus.granted) {
          return _getCurrentLocation();
        }
        return null;

      case LocationStatus.deniedRequested:
        final result = await _requestPermission();
        status = statusNotifier._applyPermission(result);
        if (status == LocationStatus.granted) {
          return _getCurrentLocation();
        }
        return null;
    }
  }

  Future<LocationPermission> _checkPermission() => Geolocator.checkPermission();

  Future<LocationPermission> _requestPermission() => Geolocator.requestPermission();

  /// Returns the device's current coarse location, or null if unavailable.
  Future<Coordinates?> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.low),
      );
      return Coordinates(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> openAppSettings() => Geolocator.openAppSettings();
}

enum LocationStatus {
  /// Permission is granted (always or whileInUse).
  granted,

  /// Permission is permanently denied — user must open settings to enable.
  deniedForever,

  /// Permission is not granted/denied-forever, and the rationale dialog has
  /// never been shown (first-time state).
  deniedNotRequested,

  /// Permission is not granted/denied-forever, but the rationale dialog has
  /// already been shown at least once.
  deniedRequested,
}

/// Notifier to maintain current [LocationStatus]. Widgets that need location should interact with the status via
/// [canGetOrAutoRequestLocationProvider] and call [LocationService.getLocationWithPermissionRequest] to trigger
/// permission requests and location retrieval with appropriate dialogs.
@Riverpod(keepAlive: true)
class _LocationStatusNotifier extends _$LocationStatusNotifier {
  static const _rationaleShownKey = 'locationRationaleShown';
  static const _statusKey = 'locationStatus';

  @override
  LocationStatus build() {
    final prefs = ref.read(sharedPrefsProvider);
    // Restore the cached status synchronously so it's immediately available.
    final cached = LocationStatus.values.where((e) => e.name == prefs.getString(_statusKey)).firstOrNull;
    // Update in background in case the user changed settings while the app was closed.
    _refresh();
    return cached ?? LocationStatus.deniedNotRequested;
  }

  Future<LocationStatus> _refresh() async {
    final permission = await ref.read(locationServiceProvider)._checkPermission();
    return _applyPermission(permission);
  }

  LocationStatus _applyPermission(LocationPermission permission) {
    final prefs = ref.read(sharedPrefsProvider);
    final newStatus = switch (permission) {
      LocationPermission.always || LocationPermission.whileInUse => LocationStatus.granted,
      LocationPermission.deniedForever => LocationStatus.deniedForever,
      _ =>
        prefs.getBool(_rationaleShownKey) == true ? LocationStatus.deniedRequested : LocationStatus.deniedNotRequested,
    };
    _setState(newStatus);
    return newStatus;
  }

  void _setState(LocationStatus newStatus) {
    state = newStatus;
    ref.read(sharedPrefsProvider).setString(_statusKey, newStatus.name);
  }

  void _onRationaleShown(bool agreed) {
    ref.read(sharedPrefsProvider).setBool(_rationaleShownKey, true);
    if (!agreed && state == LocationStatus.deniedNotRequested) {
      _setState(LocationStatus.deniedRequested);
    }
  }
}
