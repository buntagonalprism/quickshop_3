// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sharedPrefs)
final sharedPrefsProvider = SharedPrefsProvider._();

final class SharedPrefsProvider
    extends
        $FunctionalProvider<
          SharedPreferencesWithCache,
          SharedPreferencesWithCache,
          SharedPreferencesWithCache
        >
    with $Provider<SharedPreferencesWithCache> {
  SharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sharedPrefsHash();

  @$internal
  @override
  $ProviderElement<SharedPreferencesWithCache> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPreferencesWithCache create(Ref ref) {
    return sharedPrefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPreferencesWithCache value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPreferencesWithCache>(value),
    );
  }
}

String _$sharedPrefsHash() => r'56f9d658fa5945f9b6356a7d0a9f08060a9eca3e';

/// Shared preferences scoped to the signed in user, for values which should differ between users on
/// the same device. Use [sharedPrefsProvider] for values which apply to the whole device.

@ProviderFor(userSharedPrefs)
final userSharedPrefsProvider = UserSharedPrefsProvider._();

/// Shared preferences scoped to the signed in user, for values which should differ between users on
/// the same device. Use [sharedPrefsProvider] for values which apply to the whole device.

final class UserSharedPrefsProvider
    extends
        $FunctionalProvider<
          UserSharedPreferences,
          UserSharedPreferences,
          UserSharedPreferences
        >
    with $Provider<UserSharedPreferences> {
  /// Shared preferences scoped to the signed in user, for values which should differ between users on
  /// the same device. Use [sharedPrefsProvider] for values which apply to the whole device.
  UserSharedPrefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSharedPrefsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSharedPrefsHash();

  @$internal
  @override
  $ProviderElement<UserSharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserSharedPreferences create(Ref ref) {
    return userSharedPrefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSharedPreferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSharedPreferences>(value),
    );
  }
}

String _$userSharedPrefsHash() => r'5dd2577eda04642bc8acefd2fc14e93a50b69f6a';
