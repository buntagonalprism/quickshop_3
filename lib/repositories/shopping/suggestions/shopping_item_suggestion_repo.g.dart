// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_suggestion_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemSuggestionRepo)
const shoppingItemSuggestionRepoProvider =
    ShoppingItemSuggestionRepoProvider._();

final class ShoppingItemSuggestionRepoProvider
    extends
        $FunctionalProvider<
          ShoppingItemSuggestionRepo,
          ShoppingItemSuggestionRepo,
          ShoppingItemSuggestionRepo
        >
    with $Provider<ShoppingItemSuggestionRepo> {
  const ShoppingItemSuggestionRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shoppingItemSuggestionRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemSuggestionRepoHash();

  @$internal
  @override
  $ProviderElement<ShoppingItemSuggestionRepo> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingItemSuggestionRepo create(Ref ref) {
    return shoppingItemSuggestionRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemSuggestionRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemSuggestionRepo>(value),
    );
  }
}

String _$shoppingItemSuggestionRepoHash() =>
    r'eaf88145bd78c0ba7a3b3544c130ddad736e6454';
