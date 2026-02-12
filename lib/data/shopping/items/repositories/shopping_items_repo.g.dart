// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingListItemsRepo)
const shoppingListItemsRepoProvider = ShoppingListItemsRepoFamily._();

final class ShoppingListItemsRepoProvider
    extends
        $FunctionalProvider<
          ShoppingListItemsRepo,
          ShoppingListItemsRepo,
          ShoppingListItemsRepo
        >
    with $Provider<ShoppingListItemsRepo> {
  const ShoppingListItemsRepoProvider._({
    required ShoppingListItemsRepoFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingListItemsRepoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingListItemsRepoHash();

  @override
  String toString() {
    return r'shoppingListItemsRepoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingListItemsRepo> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingListItemsRepo create(Ref ref) {
    final argument = this.argument as String;
    return shoppingListItemsRepo(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingListItemsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingListItemsRepo>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListItemsRepoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingListItemsRepoHash() =>
    r'4c5da7c94b6bcad2d0b190a1899def0f6e1a8f19';

final class ShoppingListItemsRepoFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingListItemsRepo, String> {
  const ShoppingListItemsRepoFamily._()
    : super(
        retry: null,
        name: r'shoppingListItemsRepoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingListItemsRepoProvider call(String listId) =>
      ShoppingListItemsRepoProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingListItemsRepoProvider';
}
