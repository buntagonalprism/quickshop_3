// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'location_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// - `true` when location can be obtained or permission can be requested for the first time. We only request permission
///   once to avoid annoying users who do not wish to use location features.
/// - `false` when location permissions have already been requested and denied. The UI should indicate that location
///   features are unavailable. Only if the user then interacts with a location-specific action or location-disabled
///   message should the UI call getLocationWithPermissionRequest to enable location.

@ProviderFor(canGetOrAutoRequestLocation)
const canGetOrAutoRequestLocationProvider =
    CanGetOrAutoRequestLocationProvider._();

/// - `true` when location can be obtained or permission can be requested for the first time. We only request permission
///   once to avoid annoying users who do not wish to use location features.
/// - `false` when location permissions have already been requested and denied. The UI should indicate that location
///   features are unavailable. Only if the user then interacts with a location-specific action or location-disabled
///   message should the UI call getLocationWithPermissionRequest to enable location.

final class CanGetOrAutoRequestLocationProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// - `true` when location can be obtained or permission can be requested for the first time. We only request permission
  ///   once to avoid annoying users who do not wish to use location features.
  /// - `false` when location permissions have already been requested and denied. The UI should indicate that location
  ///   features are unavailable. Only if the user then interacts with a location-specific action or location-disabled
  ///   message should the UI call getLocationWithPermissionRequest to enable location.
  const CanGetOrAutoRequestLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'canGetOrAutoRequestLocationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$canGetOrAutoRequestLocationHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return canGetOrAutoRequestLocation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$canGetOrAutoRequestLocationHash() =>
    r'312ee3ae1f2fb936cea0b3b7d7324125072c968b';

@ProviderFor(locationService)
const locationServiceProvider = LocationServiceProvider._();

final class LocationServiceProvider
    extends
        $FunctionalProvider<LocationService, LocationService, LocationService>
    with $Provider<LocationService> {
  const LocationServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationServiceHash();

  @$internal
  @override
  $ProviderElement<LocationService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationService create(Ref ref) {
    return locationService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationService>(value),
    );
  }
}

String _$locationServiceHash() => r'847326110fa07375530e78934a1f1898e67a47cf';

/// Notifier to maintain current [LocationStatus]. Widgets that need location should interact with the status via
/// [canGetOrAutoRequestLocationProvider] and call [LocationService.getLocationWithPermissionRequest] to trigger
/// permission requests and location retrieval with appropriate dialogs.

@ProviderFor(_LocationStatusNotifier)
const _locationStatusProvider = _LocationStatusNotifierProvider._();

/// Notifier to maintain current [LocationStatus]. Widgets that need location should interact with the status via
/// [canGetOrAutoRequestLocationProvider] and call [LocationService.getLocationWithPermissionRequest] to trigger
/// permission requests and location retrieval with appropriate dialogs.
final class _LocationStatusNotifierProvider
    extends $NotifierProvider<_LocationStatusNotifier, LocationStatus> {
  /// Notifier to maintain current [LocationStatus]. Widgets that need location should interact with the status via
  /// [canGetOrAutoRequestLocationProvider] and call [LocationService.getLocationWithPermissionRequest] to trigger
  /// permission requests and location retrieval with appropriate dialogs.
  const _LocationStatusNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_locationStatusProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_locationStatusNotifierHash();

  @$internal
  @override
  _LocationStatusNotifier create() => _LocationStatusNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationStatus>(value),
    );
  }
}

String _$_locationStatusNotifierHash() =>
    r'9aaef31504999c696df6b4704debde8440bd30d3';

/// Notifier to maintain current [LocationStatus]. Widgets that need location should interact with the status via
/// [canGetOrAutoRequestLocationProvider] and call [LocationService.getLocationWithPermissionRequest] to trigger
/// permission requests and location retrieval with appropriate dialogs.

abstract class _$LocationStatusNotifier extends $Notifier<LocationStatus> {
  LocationStatus build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LocationStatus, LocationStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LocationStatus, LocationStatus>,
              LocationStatus,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
