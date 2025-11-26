// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userAuth)
const userAuthProvider = UserAuthProvider._();

final class UserAuthProvider
    extends $FunctionalProvider<UserAuth?, UserAuth?, UserAuth?>
    with $Provider<UserAuth?> {
  const UserAuthProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userAuthProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userAuthHash();

  @$internal
  @override
  $ProviderElement<UserAuth?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserAuth? create(Ref ref) {
    return userAuth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserAuth? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserAuth?>(value),
    );
  }
}

String _$userAuthHash() => r'd82bd1ca3531dcb8007f8fc5603921a4ef29f122';

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

String _$loggedInHash() => r'efc49d11dafa9d39a67f2def5288cb699afc283b';

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

String _$userIdHash() => r'1e21e394c541b58f830ae26963cd59f6b9feab1d';

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
