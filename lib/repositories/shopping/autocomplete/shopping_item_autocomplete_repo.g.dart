// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_autocomplete_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemAutocompleteRepo)
const shoppingItemAutocompleteRepoProvider =
    ShoppingItemAutocompleteRepoFamily._();

final class ShoppingItemAutocompleteRepoProvider extends $FunctionalProvider<
    ShoppingItemAutocompleteRepo,
    ShoppingItemAutocompleteRepo,
    ShoppingItemAutocompleteRepo> with $Provider<ShoppingItemAutocompleteRepo> {
  const ShoppingItemAutocompleteRepoProvider._(
      {required ShoppingItemAutocompleteRepoFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'shoppingItemAutocompleteRepoProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemAutocompleteRepoHash();

  @override
  String toString() {
    return r'shoppingItemAutocompleteRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingItemAutocompleteRepo> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingItemAutocompleteRepo create(Ref ref) {
    final argument = this.argument as String;
    return shoppingItemAutocompleteRepo(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemAutocompleteRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemAutocompleteRepo>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemAutocompleteRepoProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemAutocompleteRepoHash() =>
    r'86e2f1beabf003c3bb6f4f5172b6c3ae77419030';

final class ShoppingItemAutocompleteRepoFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingItemAutocompleteRepo, String> {
  const ShoppingItemAutocompleteRepoFamily._()
      : super(
          retry: null,
          name: r'shoppingItemAutocompleteRepoProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ShoppingItemAutocompleteRepoProvider call(
    String listId,
  ) =>
      ShoppingItemAutocompleteRepoProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingItemAutocompleteRepoProvider';
}
