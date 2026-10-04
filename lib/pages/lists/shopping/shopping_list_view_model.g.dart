// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The shopping list with [listId] and its items grouped by category, or null if there is no such
/// list.

@ProviderFor(shoppingList)
final shoppingListProvider = ShoppingListFamily._();

/// The shopping list with [listId] and its items grouped by category, or null if there is no such
/// list.

final class ShoppingListProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShoppingList?>,
          AsyncValue<ShoppingList?>,
          AsyncValue<ShoppingList?>
        >
    with $Provider<AsyncValue<ShoppingList?>> {
  /// The shopping list with [listId] and its items grouped by category, or null if there is no such
  /// list.
  ShoppingListProvider._({
    required ShoppingListFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingListHash();

  @override
  String toString() {
    return r'shoppingListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<ShoppingList?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<ShoppingList?> create(Ref ref) {
    final argument = this.argument as String;
    return shoppingList(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ShoppingList?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<ShoppingList?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingListHash() => r'1f88d75900736819e3cb421a8031fdcd62e530ee';

/// The shopping list with [listId] and its items grouped by category, or null if there is no such
/// list.

final class ShoppingListFamily extends $Family
    with $FunctionalFamilyOverride<AsyncValue<ShoppingList?>, String> {
  ShoppingListFamily._()
    : super(
        retry: null,
        name: r'shoppingListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The shopping list with [listId] and its items grouped by category, or null if there is no such
  /// list.

  ShoppingListProvider call(String listId) =>
      ShoppingListProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingListProvider';
}
