// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_category_suggestion_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingCategorySuggestionRepo)
final shoppingCategorySuggestionRepoProvider =
    ShoppingCategorySuggestionRepoProvider._();

final class ShoppingCategorySuggestionRepoProvider
    extends
        $FunctionalProvider<
          ShoppingCategorySuggestionRepo,
          ShoppingCategorySuggestionRepo,
          ShoppingCategorySuggestionRepo
        >
    with $Provider<ShoppingCategorySuggestionRepo> {
  ShoppingCategorySuggestionRepoProvider._()
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
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingCategorySuggestionRepo create(Ref ref) {
    return shoppingCategorySuggestionRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingCategorySuggestionRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingCategorySuggestionRepo>(
        value,
      ),
    );
  }
}

String _$shoppingCategorySuggestionRepoHash() =>
    r'e22ee2985b65ae1a76c6f1348efbd3f8a1422fa8';
