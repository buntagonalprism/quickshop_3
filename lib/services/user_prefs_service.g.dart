// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'user_prefs_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userPrefsService)
final userPrefsServiceProvider = UserPrefsServiceProvider._();

final class UserPrefsServiceProvider
    extends
        $FunctionalProvider<
          UserPrefsService,
          UserPrefsService,
          UserPrefsService
        >
    with $Provider<UserPrefsService> {
  UserPrefsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userPrefsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userPrefsServiceHash();

  @$internal
  @override
  $ProviderElement<UserPrefsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserPrefsService create(Ref ref) {
    return userPrefsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserPrefsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserPrefsService>(value),
    );
  }
}

String _$userPrefsServiceHash() => r'bfa7b3bcfd10d3482b5fc18f66a17f868ea1d55e';
