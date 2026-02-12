// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userProfile)
const userProfileProvider = UserProfileProvider._();

final class UserProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserProfile?>,
          UserProfile?,
          Stream<UserProfile?>
        >
    with $FutureModifier<UserProfile?>, $StreamProvider<UserProfile?> {
  const UserProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileHash();

  @$internal
  @override
  $StreamProviderElement<UserProfile?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<UserProfile?> create(Ref ref) {
    return userProfile(ref);
  }
}

String _$userProfileHash() => r'e1321c2713503785d6f595c6172e8e16fb141314';

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
