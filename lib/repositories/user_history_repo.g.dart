// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userHistoryRepo)
const userHistoryRepoProvider = UserHistoryRepoProvider._();

final class UserHistoryRepoProvider extends $FunctionalProvider<UserHistoryRepo,
    UserHistoryRepo, UserHistoryRepo> with $Provider<UserHistoryRepo> {
  const UserHistoryRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'userHistoryRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$userHistoryRepoHash();

  @$internal
  @override
  $ProviderElement<UserHistoryRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserHistoryRepo create(Ref ref) {
    return userHistoryRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserHistoryRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserHistoryRepo>(value),
    );
  }
}

String _$userHistoryRepoHash() => r'6231d52b83986b5dcd3c0e48033472cbe3bd3cbf';
