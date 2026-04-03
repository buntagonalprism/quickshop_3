import 'dart:io';

/// Configuration for Google Maps Platform, including Google Maps and Places APIs
class GoogleMapsPlatformConfig {
  static final apiKey = Platform.isAndroid
      ? const String.fromEnvironment('GOOGLE_MAPS_PLATFORM_API_KEY_ANDROID')
      : const String.fromEnvironment('GOOGLE_MAPS_PLATFORM_API_KEY_IOS');
}
