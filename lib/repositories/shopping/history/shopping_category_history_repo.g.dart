// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_category_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingCategoryHistoryRepo)
const shoppingCategoryHistoryRepoProvider =
    ShoppingCategoryHistoryRepoProvider._();

final class ShoppingCategoryHistoryRepoProvider extends $FunctionalProvider<
    ShoppingCategoryHistoryRepo,
    ShoppingCategoryHistoryRepo,
    ShoppingCategoryHistoryRepo> with $Provider<ShoppingCategoryHistoryRepo> {
  const ShoppingCategoryHistoryRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'shoppingCategoryHistoryRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingCategoryHistoryRepoHash();

  @$internal
  @override
  $ProviderElement<ShoppingCategoryHistoryRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingCategoryHistoryRepo create(Ref ref) {
    return shoppingCategoryHistoryRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingCategoryHistoryRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingCategoryHistoryRepo>(value),
    );
  }
}

String _$shoppingCategoryHistoryRepoHash() =>
    r'dec74a8c5d07a0a62de9aaafeb35f2dd52ef1a90';
