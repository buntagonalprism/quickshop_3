// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemAutocomplete)
const itemAutocompleteProvider = ItemAutocompleteFamily._();

final class ItemAutocompleteProvider extends $FunctionalProvider<
        AsyncValue<List<ShoppingItemAutocomplete>>,
        List<ShoppingItemAutocomplete>,
        FutureOr<List<ShoppingItemAutocomplete>>>
    with
        $FutureModifier<List<ShoppingItemAutocomplete>>,
        $FutureProvider<List<ShoppingItemAutocomplete>> {
  const ItemAutocompleteProvider._(
      {required ItemAutocompleteFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'itemAutocompleteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$itemAutocompleteHash();

  @override
  String toString() {
    return r'itemAutocompleteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ShoppingItemAutocomplete>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShoppingItemAutocomplete>> create(Ref ref) {
    final argument = this.argument as String;
    return itemAutocomplete(
      ref,
      argument,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemAutocompleteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemAutocompleteHash() => r'cebfbf2689dadb0d9c9e7ecabfed623f377e63b2';

final class ItemAutocompleteFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<ShoppingItemAutocomplete>>,
            String> {
  const ItemAutocompleteFamily._()
      : super(
          retry: null,
          name: r'itemAutocompleteProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ItemAutocompleteProvider call(
    String listId,
  ) =>
      ItemAutocompleteProvider._(argument: listId, from: this);

  @override
  String toString() => r'itemAutocompleteProvider';
}

@ProviderFor(ShoppingItemCreateViewModel)
const shoppingItemCreateViewModelProvider =
    ShoppingItemCreateViewModelProvider._();

final class ShoppingItemCreateViewModelProvider extends $NotifierProvider<
    ShoppingItemCreateViewModel, ShoppingItemCreateModel> {
  const ShoppingItemCreateViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'shoppingItemCreateViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemCreateViewModelHash();

  @$internal
  @override
  ShoppingItemCreateViewModel create() => ShoppingItemCreateViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemCreateModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingItemCreateModel>(value),
    );
  }
}

String _$shoppingItemCreateViewModelHash() =>
    r'4e7525473dae8909994bb72d4f9ed3128cae65e7';

abstract class _$ShoppingItemCreateViewModel
    extends $Notifier<ShoppingItemCreateModel> {
  ShoppingItemCreateModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<ShoppingItemCreateModel, ShoppingItemCreateModel>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ShoppingItemCreateModel, ShoppingItemCreateModel>,
        ShoppingItemCreateModel,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
