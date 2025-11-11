// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepo)
const userRepoProvider = UserRepoProvider._();

final class UserRepoProvider
    extends $FunctionalProvider<UserRepo, UserRepo, UserRepo>
    with $Provider<UserRepo> {
  const UserRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userRepoHash();

  @$internal
  @override
  $ProviderElement<UserRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepo create(Ref ref) {
    return userRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepo>(value),
    );
  }
}

String _$userRepoHash() => r'63278c3a08163ddf8e319b1de8dda82649090d25';
