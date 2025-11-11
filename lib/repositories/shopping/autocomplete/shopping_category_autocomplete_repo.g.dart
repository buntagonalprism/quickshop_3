// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_category_autocomplete_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingCategoryAutocompleteRepo)
const shoppingCategoryAutocompleteRepoProvider =
    ShoppingCategoryAutocompleteRepoFamily._();

final class ShoppingCategoryAutocompleteRepoProvider
    extends $FunctionalProvider<ShoppingCategoryAutocompleteRepo,
        ShoppingCategoryAutocompleteRepo, ShoppingCategoryAutocompleteRepo>
    with $Provider<ShoppingCategoryAutocompleteRepo> {
  const ShoppingCategoryAutocompleteRepoProvider._(
      {required ShoppingCategoryAutocompleteRepoFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'shoppingCategoryAutocompleteRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingCategoryAutocompleteRepoHash();

  @override
  String toString() {
    return r'shoppingCategoryAutocompleteRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingCategoryAutocompleteRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingCategoryAutocompleteRepo create(Ref ref) {
    final argument = this.argument as String;
    return shoppingCategoryAutocompleteRepo(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingCategoryAutocompleteRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ShoppingCategoryAutocompleteRepo>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingCategoryAutocompleteRepoProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingCategoryAutocompleteRepoHash() =>
    r'82591ed13277c3be38c2266b273a36676322d59c';

final class ShoppingCategoryAutocompleteRepoFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingCategoryAutocompleteRepo, String> {
  const ShoppingCategoryAutocompleteRepoFamily._()
      : super(
          retry: null,
          name: r'shoppingCategoryAutocompleteRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ShoppingCategoryAutocompleteRepoProvider call(
    String listId,
  ) =>
      ShoppingCategoryAutocompleteRepoProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingCategoryAutocompleteRepoProvider';
}
