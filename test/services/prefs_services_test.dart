import 'package:flutter_test/flutter_test.dart';
import 'package:quickshop/services/auth_service.dart';
import 'package:quickshop/services/unauth_prefs_service.dart';
import 'package:quickshop/services/user_prefs_service.dart';
import 'package:riverpod/riverpod.dart';

import '../fakes/fake_shared_preferences.dart';
import '../utilities/create_provider_container.dart';

void main() {
  late FakeSharedPreferences prefs;
  late ProviderContainer container;
  String? userId;

  setUp(() {
    prefs = FakeSharedPreferences();
    userId = 'user-a';
    container = createContainer(
      overrides: [
        userPrefsServiceProvider.overrideWith((ref) => UserPrefsService(ref, prefs)),
        unauthPrefsServiceProvider.overrideWithValue(UnauthPrefsService(prefs)),
        userIdProvider.overrideWith((ref) => userId),
      ],
    );
  });

  void signInAs(String? id) {
    userId = id;
    container.invalidate(userIdProvider);
  }

  group('UserPrefsService', () {
    test('Stores values separately for each user', () async {
      final userPrefs = container.read(userPrefsServiceProvider);
      await userPrefs.setString('key', 'a');

      signInAs('user-b');
      expect(userPrefs.getString('key'), isNull);
      await userPrefs.setString('key', 'b');

      signInAs('user-a');
      expect(userPrefs.getString('key'), 'a');
    });

    test('Is the same instance for every user', () {
      final first = container.read(userPrefsServiceProvider);
      signInAs('user-b');
      expect(container.read(userPrefsServiceProvider), same(first));
    });

    test('Stores values for an unauthenticated user while signed out', () async {
      signInAs(null);
      final userPrefs = container.read(userPrefsServiceProvider);
      await userPrefs.setBool('key', true);

      expect(userPrefs.getBool('key'), true);
      signInAs('user-a');
      expect(userPrefs.getBool('key'), isNull);
    });
  });

  group('UnauthPrefsService', () {
    test('Shares values across users', () async {
      final unauthPrefs = container.read(unauthPrefsServiceProvider);
      await unauthPrefs.setInt('key', 1);

      signInAs('user-b');
      expect(unauthPrefs.getInt('key'), 1);
    });

    test('Keeps existing unprefixed values', () async {
      await prefs.setString('themeMode', 'dark');
      expect(container.read(unauthPrefsServiceProvider).getString('themeMode'), 'dark');
    });

    test('Does not collide with user values', () async {
      await container.read(unauthPrefsServiceProvider).setString('key', 'device');
      await container.read(userPrefsServiceProvider).setString('key', 'user');

      expect(container.read(unauthPrefsServiceProvider).getString('key'), 'device');
      expect(container.read(userPrefsServiceProvider).getString('key'), 'user');
    });
  });
}
