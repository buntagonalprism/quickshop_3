// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(loggedIn)
const loggedInProvider = LoggedInProvider._();

final class LoggedInProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const LoggedInProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'loggedInProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$loggedInHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return loggedIn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loggedInHash() => r'9b22318a238096d5c49eced6843f0e2098b1eea9';

@ProviderFor(userId)
const userIdProvider = UserIdProvider._();

final class UserIdProvider
    extends $FunctionalProvider<String?, String?, String?>
    with $Provider<String?> {
  const UserIdProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userIdProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userIdHash();

  @$internal
  @override
  $ProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String? create(Ref ref) {
    return userId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$userIdHash() => r'cf90573ef6c6dde40233a46a5e224142a26b3483';

@ProviderFor(authService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $FunctionalProvider<AuthService, AuthService, AuthService>
    with $Provider<AuthService> {
  const AuthServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'authServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  $ProviderElement<AuthService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthService create(Ref ref) {
    return authService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthService>(value),
    );
  }
}

String _$authServiceHash() => r'f3704361ff66d151d86200240344d66b2995be3d';

@ProviderFor(_authUserStream)
const _authUserStreamProvider = _AuthUserStreamProvider._();

final class _AuthUserStreamProvider extends $FunctionalProvider<
        AsyncValue<DateTime>, DateTime, Stream<DateTime>>
    with $FutureModifier<DateTime>, $StreamProvider<DateTime> {
  const _AuthUserStreamProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'_authUserStreamProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$_authUserStreamHash();

  @$internal
  @override
  $StreamProviderElement<DateTime> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<DateTime> create(Ref ref) {
    return _authUserStream(ref);
  }
}

String _$_authUserStreamHash() => r'd97a156c7df1c84d4e67102c10b5b9d6d505fbb7';
