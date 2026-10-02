// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_category_autocomplete_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shoppingCategoryAutocompleteUseCase)
final shoppingCategoryAutocompleteUseCaseProvider =
    ShoppingCategoryAutocompleteUseCaseFamily._();

final class ShoppingCategoryAutocompleteUseCaseProvider
    extends
        $FunctionalProvider<
          ShoppingCategoryAutocompleteUseCase,
          ShoppingCategoryAutocompleteUseCase,
          ShoppingCategoryAutocompleteUseCase
        >
    with $Provider<ShoppingCategoryAutocompleteUseCase> {
  ShoppingCategoryAutocompleteUseCaseProvider._({
    required ShoppingCategoryAutocompleteUseCaseFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'shoppingCategoryAutocompleteUseCaseProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$shoppingCategoryAutocompleteUseCaseHash();

  @override
  String toString() {
    return r'shoppingCategoryAutocompleteUseCaseProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ShoppingCategoryAutocompleteUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ShoppingCategoryAutocompleteUseCase create(Ref ref) {
    final argument = this.argument as String;
    return shoppingCategoryAutocompleteUseCase(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShoppingCategoryAutocompleteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShoppingCategoryAutocompleteUseCase>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingCategoryAutocompleteUseCaseProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingCategoryAutocompleteUseCaseHash() =>
    r'42f743cc13692d273af231604c573e0e94fef7b6';

final class ShoppingCategoryAutocompleteUseCaseFamily extends $Family
    with
        $FunctionalFamilyOverride<ShoppingCategoryAutocompleteUseCase, String> {
  ShoppingCategoryAutocompleteUseCaseFamily._()
    : super(
        retry: null,
        name: r'shoppingCategoryAutocompleteUseCaseProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ShoppingCategoryAutocompleteUseCaseProvider call(String listId) =>
      ShoppingCategoryAutocompleteUseCaseProvider._(
        argument: listId,
        from: this,
      );

  @override
  String toString() => r'shoppingCategoryAutocompleteUseCaseProvider';
}
