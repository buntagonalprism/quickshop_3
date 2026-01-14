// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingListViewModel)
const shoppingListViewModelProvider = ShoppingListViewModelFamily._();

final class ShoppingListViewModelProvider
    extends
        $FunctionalProvider<
          ShoppingListViewModel,
          ShoppingListViewModel,
          ShoppingListViewModel
        >
    with $Provider<ShoppingListViewModel> {
  const ShoppingListViewModelProvider._({
    required ShoppingListViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingListViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingListViewModelHash();

  @override
  String toString() {
    return r'shoppingListViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingListViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingListViewModel create(Ref ref) {
    final argument = this.argument as String;
    return shoppingListViewModel(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingListViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingListViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingListViewModelHash() =>
    r'5350de00665dc92d65ff1d635f9f11e99e492e71';

final class ShoppingListViewModelFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingListViewModel, String> {
  const ShoppingListViewModelFamily._()
    : super(
        retry: null,
        name: r'shoppingListViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingListViewModelProvider call(String listId) =>
      ShoppingListViewModelProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingListViewModelProvider';
}
