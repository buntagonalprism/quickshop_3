// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_history_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemHistoryRepo)
const shoppingItemHistoryRepoProvider = ShoppingItemHistoryRepoProvider._();

final class ShoppingItemHistoryRepoProvider extends $FunctionalProvider<
    ShoppingItemHistoryRepo,
    ShoppingItemHistoryRepo,
    ShoppingItemHistoryRepo> with $Provider<ShoppingItemHistoryRepo> {
  const ShoppingItemHistoryRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'shoppingItemHistoryRepoProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemHistoryRepoHash();

  @$internal
  @override
  $ProviderElement<ShoppingItemHistoryRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingItemHistoryRepo create(Ref ref) {
    return shoppingItemHistoryRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemHistoryRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemHistoryRepo>(value),
    );
  }
}

String _$shoppingItemHistoryRepoHash() =>
    r'09ce8c04217b99b2559fc2150dd3065d72de7d56';
