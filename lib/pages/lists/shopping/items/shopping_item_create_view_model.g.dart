// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(itemAutocomplete)
final itemAutocompleteProvider = ItemAutocompleteFamily._();

final class ItemAutocompleteProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShoppingItemAutocomplete>>,
          List<ShoppingItemAutocomplete>,
          FutureOr<List<ShoppingItemAutocomplete>>
        >
    with
        $FutureModifier<List<ShoppingItemAutocomplete>>,
        $FutureProvider<List<ShoppingItemAutocomplete>> {
  ItemAutocompleteProvider._({
    required ItemAutocompleteFamily super.from,
    required String super.argument,
  }) : super(
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
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShoppingItemAutocomplete>> create(Ref ref) {
    final argument = this.argument as String;
    return itemAutocomplete(ref, argument);
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

String _$itemAutocompleteHash() => r'4c8ca87f469891f1e2a6f1996e4544c47342304f';

final class ItemAutocompleteFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ShoppingItemAutocomplete>>,
          String
        > {
  ItemAutocompleteFamily._()
    : super(
        retry: null,
        name: r'itemAutocompleteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ItemAutocompleteProvider call(String listId) =>
      ItemAutocompleteProvider._(argument: listId, from: this);

  @override
  String toString() => r'itemAutocompleteProvider';
}

@ProviderFor(ItemForm)
final itemFormProvider = ItemFormProvider._();

final class ItemFormProvider extends $NotifierProvider<ItemForm, ItemFormData> {
  ItemFormProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'itemFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$itemFormHash();

  @$internal
  @override
  ItemForm create() => ItemForm();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ItemFormData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ItemFormData>(value),
    );
  }
}

String _$itemFormHash() => r'332407c869f44664e9c6c92b7a84177683cec935';

abstract class _$ItemForm extends $Notifier<ItemFormData> {
  ItemFormData build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ItemFormData, ItemFormData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ItemFormData, ItemFormData>,
              ItemFormData,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
