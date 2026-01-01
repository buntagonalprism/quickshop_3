import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_service.g.dart';

@Riverpod(keepAlive: true)
SettingsService settingsService(Ref ref) {
  throw UnimplementedError('Initialsed in main.dart');
}

class SettingsService {
  final localBackendEnabled = const bool.fromEnvironment('LOCAL_BACKEND_ENABLED', defaultValue: false);
  late final String localBackendHost;

  static Future<SettingsService> init() async {
    final service = SettingsService();
    await service._init();
    return service;
  }

  Future<void> _init() async {
    final deviceType = await _getDeviceType();
    localBackendHost = _getLocalBackendHost(deviceType);
  }

  Future<DeviceType> _getDeviceType() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return androidInfo.isPhysicalDevice == true ? DeviceType.androidPhysical : DeviceType.androidEmulator;
    } else if (Platform.isIOS) {
      final iosInfo = await DeviceInfoPlugin().iosInfo;
      return iosInfo.isPhysicalDevice == true ? DeviceType.iosPhysical : DeviceType.iosSimulator;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  String _getLocalBackendHost(DeviceType deviceType) {
    if (localBackendEnabled) {
      switch (deviceType) {
        // Android emulators can access the host machine's localhost via a dedicated loopback IP address
        // https://developer.android.com/studio/run/emulator-networking
        case DeviceType.androidEmulator:
          return '10.0.2.2';

        case DeviceType.iosSimulator:
          return 'localhost';

        // Physical devices need to use the host machine's local network IP address.
        // This requires that the host machine and device are on the same network.
        case DeviceType.androidPhysical:
        case DeviceType.iosPhysical:
          final localIp = const String.fromEnvironment('LOCAL_BACKEND_IP', defaultValue: '');
          if (localIp.isNotEmpty) {
            return localIp;
          }
      }
    }
    return 'local-backend-disabled';
  }
}

enum DeviceType { androidEmulator, androidPhysical, iosSimulator, iosPhysical }
