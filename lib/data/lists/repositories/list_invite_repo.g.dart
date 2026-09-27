// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'list_invite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listInviteRepo)
final listInviteRepoProvider = ListInviteRepoProvider._();

final class ListInviteRepoProvider
    extends $FunctionalProvider<ListInviteRepo, ListInviteRepo, ListInviteRepo>
    with $Provider<ListInviteRepo> {
  ListInviteRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listInviteRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listInviteRepoHash();

  @$internal
  @override
  $ProviderElement<ListInviteRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ListInviteRepo create(Ref ref) {
    return listInviteRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListInviteRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListInviteRepo>(value),
    );
  }
}

String _$listInviteRepoHash() => r'cd59dfed1cba6b1b77ac17ddbb3a017074b55173';
