// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'settings_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRepo)
final settingsRepoProvider = SettingsRepoProvider._();

final class SettingsRepoProvider
    extends $FunctionalProvider<SettingsRepo, SettingsRepo, SettingsRepo>
    with $Provider<SettingsRepo> {
  SettingsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepoHash();

  @$internal
  @override
  $ProviderElement<SettingsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRepo create(Ref ref) {
    return settingsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepo>(value),
    );
  }
}

String _$settingsRepoHash() => r'6144ef919390ba7379c979063f8e35be9934482c';
