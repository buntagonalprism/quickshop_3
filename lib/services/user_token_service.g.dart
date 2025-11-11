// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userTokenService)
const userTokenServiceProvider = UserTokenServiceProvider._();

final class UserTokenServiceProvider extends $FunctionalProvider<
    UserTokenService,
    UserTokenService,
    UserTokenService> with $Provider<UserTokenService> {
  const UserTokenServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userTokenServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userTokenServiceHash();

  @$internal
  @override
  $ProviderElement<UserTokenService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserTokenService create(Ref ref) {
    return userTokenService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserTokenService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserTokenService>(value),
    );
  }
}

String _$userTokenServiceHash() => r'e33cef97861ae8a74e38a936dc03fe16f04026db';
