// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_edit_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemEditViewModel)
const shoppingItemEditViewModelProvider = ShoppingItemEditViewModelFamily._();

final class ShoppingItemEditViewModelProvider
    extends
        $FunctionalProvider<
          ShoppingItemEditModel,
          ShoppingItemEditModel,
          ShoppingItemEditModel
        >
    with $Provider<ShoppingItemEditModel> {
  const ShoppingItemEditViewModelProvider._({
    required ShoppingItemEditViewModelFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'shoppingItemEditViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemEditViewModelHash();

  @override
  String toString() {
    return r'shoppingItemEditViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<ShoppingItemEditModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingItemEditModel create(Ref ref) {
    final argument = this.argument as (String, String);
    return shoppingItemEditViewModel(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemEditModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemEditModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemEditViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemEditViewModelHash() =>
    r'199ab60cde7189b52bff64b2a515de061cf703f3';

final class ShoppingItemEditViewModelFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingItemEditModel, (String, String)> {
  const ShoppingItemEditViewModelFamily._()
    : super(
        retry: null,
        name: r'shoppingItemEditViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShoppingItemEditViewModelProvider call(String listId, String itemId) =>
      ShoppingItemEditViewModelProvider._(
        argument: (listId, itemId),
        from: this,
      );

  @override
  String toString() => r'shoppingItemEditViewModelProvider';
}
