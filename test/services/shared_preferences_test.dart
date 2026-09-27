import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:quickshop/services/auth_service.dart';
import 'package:quickshop/services/shared_preferences.dart';

import '../fakes/fake_shared_preferences.dart';
import '../utilities/create_provider_container.dart';

void main() {
  late FakeSharedPreferences prefs;
  String? userId;

  setUp(() {
    prefs = FakeSharedPreferences();
    userId = 'user-a';
  });

  UserSharedPreferences read(ProviderContainer container) => container.read(userSharedPrefsProvider);

  test('Values are stored separately for each user', () async {
    final container = createContainer(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        userIdProvider.overrideWith((ref) => userId),
      ],
    );

    await read(container).setString('key', 'a');
    userId = 'user-b';
    container.invalidate(userIdProvider);

    expect(read(container).getString('key'), isNull);
    await read(container).setString('key', 'b');

    userId = 'user-a';
    container.invalidate(userIdProvider);
    expect(read(container).getString('key'), 'a');
  });

  test('Values do not collide with device-wide preferences', () async {
    final container = createContainer(
      overrides: [
        sharedPrefsProvider.overrideWithValue(prefs),
        userIdProvider.overrideWith((ref) => userId),
      ],
    );

    await prefs.setBool('key', true);
    await read(container).setBool('key', false);

    expect(prefs.getBool('key'), true);
    expect(read(container).getBool('key'), false);
  });
}
