// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_autocomplete_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingItemAutocompleteUseCase)
const shoppingItemAutocompleteUseCaseProvider =
    ShoppingItemAutocompleteUseCaseFamily._();

final class ShoppingItemAutocompleteUseCaseProvider extends $FunctionalProvider<
        ShoppingItemAutocompleteUseCase,
        ShoppingItemAutocompleteUseCase,
        ShoppingItemAutocompleteUseCase>
    with $Provider<ShoppingItemAutocompleteUseCase> {
  const ShoppingItemAutocompleteUseCaseProvider._(
      {required ShoppingItemAutocompleteUseCaseFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'shoppingItemAutocompleteUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemAutocompleteUseCaseHash();

  @override
  String toString() {
    return r'shoppingItemAutocompleteUseCaseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingItemAutocompleteUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ShoppingItemAutocompleteUseCase create(Ref ref) {
    final argument = this.argument as String;
    return shoppingItemAutocompleteUseCase(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingItemAutocompleteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<ShoppingItemAutocompleteUseCase>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemAutocompleteUseCaseProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemAutocompleteUseCaseHash() =>
    r'088948c54c14d865ae941cdc03ff96a95e3ad014';

final class ShoppingItemAutocompleteUseCaseFamily extends $Family
    with $FunctionalFamilyOverride<ShoppingItemAutocompleteUseCase, String> {
  const ShoppingItemAutocompleteUseCaseFamily._()
      : super(
          retry: null,
          name: r'shoppingItemAutocompleteUseCaseProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ShoppingItemAutocompleteUseCaseProvider call(
    String listId,
  ) =>
      ShoppingItemAutocompleteUseCaseProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingItemAutocompleteUseCaseProvider';
}
