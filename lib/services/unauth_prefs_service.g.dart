// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'unauth_prefs_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(unauthPrefsService)
final unauthPrefsServiceProvider = UnauthPrefsServiceProvider._();

final class UnauthPrefsServiceProvider
    extends
        $FunctionalProvider<
          UnauthPrefsService,
          UnauthPrefsService,
          UnauthPrefsService
        >
    with $Provider<UnauthPrefsService> {
  UnauthPrefsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unauthPrefsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unauthPrefsServiceHash();

  @$internal
  @override
  $ProviderElement<UnauthPrefsService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UnauthPrefsService create(Ref ref) {
    return unauthPrefsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UnauthPrefsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UnauthPrefsService>(value),
    );
  }
}

String _$unauthPrefsServiceHash() =>
    r'457f0ee917a6761c4f6d032a19172d7061a8c600';
