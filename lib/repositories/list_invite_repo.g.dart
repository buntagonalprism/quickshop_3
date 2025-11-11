// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listInviteRepo)
const listInviteRepoProvider = ListInviteRepoProvider._();

final class ListInviteRepoProvider
    extends $FunctionalProvider<ListInviteRepo, ListInviteRepo, ListInviteRepo>
    with $Provider<ListInviteRepo> {
  const ListInviteRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'listInviteRepoProvider',
          isAutoDispose: true,
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

String _$listInviteRepoHash() => r'05576e133a43a8018739672e680b984c37c4542c';
