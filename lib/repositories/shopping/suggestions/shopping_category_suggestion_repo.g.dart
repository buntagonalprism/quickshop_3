// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_category_suggestion_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingCategorySuggestionRepo)
const shoppingCategorySuggestionRepoProvider =
    ShoppingCategorySuggestionRepoProvider._();

final class ShoppingCategorySuggestionRepoProvider extends $FunctionalProvider<
        ShoppingCategorySuggestionRepo,
        ShoppingCategorySuggestionRepo,
        ShoppingCategorySuggestionRepo>
    with $Provider<ShoppingCategorySuggestionRepo> {
  const ShoppingCategorySuggestionRepoProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'shoppingCategorySuggestionRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingCategorySuggestionRepoHash();

  @$internal
  @override
  $ProviderElement<ShoppingCategorySuggestionRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingCategorySuggestionRepo create(Ref ref) {
    return shoppingCategorySuggestionRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingCategorySuggestionRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ShoppingCategorySuggestionRepo>(value),
    );
  }
}

String _$shoppingCategorySuggestionRepoHash() =>
    r'2245182e4d104446e280b6e22b82030903aca753';
