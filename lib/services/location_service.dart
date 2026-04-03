import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/common/models/coordinates.dart';

part 'location_service.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(Ref ref) => LocationService();

class LocationService {
  Future<LocationPermission> checkPermission() => Geolocator.checkPermission();

  Future<LocationPermission> requestPermission() => Geolocator.requestPermission();

  /// Returns the device's current coarse location, or null if unavailable.
  Future<Coordinates?> getCurrentLocation() async {
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
