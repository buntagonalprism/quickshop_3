// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listRepo)
const listRepoProvider = ListRepoProvider._();

final class ListRepoProvider
    extends $FunctionalProvider<ListRepo, ListRepo, ListRepo>
    with $Provider<ListRepo> {
  const ListRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listRepoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listRepoHash();

  @$internal
  @override
  $ProviderElement<ListRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ListRepo create(Ref ref) {
    return listRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListRepo>(value),
    );
  }
}

String _$listRepoHash() => r'd2da06d7d40341f488228766b5db4f09b4e92c3e';
