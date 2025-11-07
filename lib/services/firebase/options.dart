import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static const unsupportedPlatformMessage = 'Platform not supported. To setup this platform:\n'
      '- Run the FlutterFire CLI for the new platform and a target Firebase environment project\n'
      '- Copy the `FirebaseOptions` object for the platform from the generated dart file to this file, and delete the generated file\n'
      '- Move any new values from the `FirebaseOptions` object into the corresponding app_secrets_<ENV>.json file for the target environment\n'
      '- Replace values in the `FirebaseOptions` object with `String.fromEnvironment("key")` calls\n'
      '- Repeat for each target environment';

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
            'DefaultFirebaseOptions have not been configured for ios. $unsupportedPlatformMessage');
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos. $unsupportedPlatformMessage',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows. $unsupportedPlatformMessage',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux. $unsupportedPlatformMessage',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: String.fromEnvironment('firebaseWebApiKey'),
    appId: String.fromEnvironment('firebaseWebAppId'),
    messagingSenderId: String.fromEnvironment('firebaseMessagingSenderId'),
    projectId: String.fromEnvironment('firebaseProjectId'),
    authDomain: '${String.fromEnvironment('firebaseProjectId')}.firebaseapp.com',
    storageBucket: String.fromEnvironment('firebaseStorageBucket'),
    measurementId: String.fromEnvironment('firebaseWebMeasurementId'),
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: String.fromEnvironment('firebaseAndroidApiKey'),
    appId: String.fromEnvironment('firebaseAndroidAppId'),
    messagingSenderId: String.fromEnvironment('firebaseMessagingSenderId'),
    projectId: String.fromEnvironment('firebaseProjectId'),
    databaseURL: 'https://${String.fromEnvironment('firebaseProjectId')}.firebaseio.com',
    storageBucket: String.fromEnvironment('firebaseStorageBucket'),
  );

  static const String googleSignInClientId =
      String.fromEnvironment('firebaseGoogleAuthWebClientId');
}
