// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryFilter)
const categoryFilterProvider = CategoryFilterFamily._();

final class CategoryFilterProvider
    extends $NotifierProvider<CategoryFilter, String> {
  const CategoryFilterProvider._({
    required CategoryFilterFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categoryFilterProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryFilterHash();

  @override
  String toString() {
    return r'categoryFilterProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CategoryFilter create() => CategoryFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryFilterProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryFilterHash() => r'ae8e51b251d456d6cf88eb8ed5da494c81bf0e3e';

final class CategoryFilterFamily extends $Family
    with $ClassFamilyOverride<CategoryFilter, String, String, String, String> {
  const CategoryFilterFamily._()
    : super(
        retry: null,
        name: r'categoryFilterProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryFilterProvider call(String listId) =>
      CategoryFilterProvider._(argument: listId, from: this);

  @override
  String toString() => r'categoryFilterProvider';
}

abstract class _$CategoryFilter extends $Notifier<String> {
  late final _$args = ref.$arg as String;
  String get listId => _$args;

  String build(String listId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(categoryAutocomplete)
const categoryAutocompleteProvider = CategoryAutocompleteFamily._();

final class CategoryAutocompleteProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ShoppingCategoryAutocomplete>>,
          List<ShoppingCategoryAutocomplete>,
          FutureOr<List<ShoppingCategoryAutocomplete>>
        >
    with
        $FutureModifier<List<ShoppingCategoryAutocomplete>>,
        $FutureProvider<List<ShoppingCategoryAutocomplete>> {
  const CategoryAutocompleteProvider._({
    required CategoryAutocompleteFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categoryAutocompleteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryAutocompleteHash();

  @override
  String toString() {
    return r'categoryAutocompleteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ShoppingCategoryAutocomplete>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ShoppingCategoryAutocomplete>> create(Ref ref) {
    final argument = this.argument as String;
    return categoryAutocomplete(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryAutocompleteProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryAutocompleteHash() =>
    r'9bc6307f9089d8e4e6d77f28aeccfc3b0e26edb2';

final class CategoryAutocompleteFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<ShoppingCategoryAutocomplete>>,
          String
        > {
  const CategoryAutocompleteFamily._()
    : super(
        retry: null,
        name: r'categoryAutocompleteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategoryAutocompleteProvider call(String listId) =>
      CategoryAutocompleteProvider._(argument: listId, from: this);

  @override
  String toString() => r'categoryAutocompleteProvider';
}
