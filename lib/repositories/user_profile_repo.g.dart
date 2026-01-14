// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userProfileRepo)
const userProfileRepoProvider = UserProfileRepoProvider._();

final class UserProfileRepoProvider
    extends
        $FunctionalProvider<UserProfileRepo, UserProfileRepo, UserProfileRepo>
    with $Provider<UserProfileRepo> {
  const UserProfileRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileRepoHash();

  @$internal
  @override
  $ProviderElement<UserProfileRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserProfileRepo create(Ref ref) {
    return userProfileRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserProfileRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserProfileRepo>(value),
    );
  }
}

String _$userProfileRepoHash() => r'f5dcd5503f2295dee39b7c6c7bcd8c5c3eeb0dde';
