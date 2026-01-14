// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryFilter)
const categoryFilterProvider = CategoryFilterProvider._();

final class CategoryFilterProvider
    extends $NotifierProvider<CategoryFilter, String> {
  const CategoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryFilterHash();

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
}

String _$categoryFilterHash() => r'e1541cb38ecdbb07e72fb5f47157bd863db23d1a';

abstract class _$CategoryFilter extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
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

@ProviderFor(categorySelectorViewModel)
const categorySelectorViewModelProvider = CategorySelectorViewModelFamily._();

final class CategorySelectorViewModelProvider
    extends
        $FunctionalProvider<
          CategorySelectorViewModel,
          CategorySelectorViewModel,
          CategorySelectorViewModel
        >
    with $Provider<CategorySelectorViewModel> {
  const CategorySelectorViewModelProvider._({
    required CategorySelectorViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'categorySelectorViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categorySelectorViewModelHash();

  @override
  String toString() {
    return r'categorySelectorViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<CategorySelectorViewModel> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategorySelectorViewModel create(Ref ref) {
    final argument = this.argument as String;
    return categorySelectorViewModel(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategorySelectorViewModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategorySelectorViewModel>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategorySelectorViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categorySelectorViewModelHash() =>
    r'faa927d031b2c38669c76a7ce67c315afd7421dc';

final class CategorySelectorViewModelFamily extends $Family
    with $FunctionalFamilyOverride<CategorySelectorViewModel, String> {
  const CategorySelectorViewModelFamily._()
    : super(
        retry: null,
        name: r'categorySelectorViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CategorySelectorViewModelProvider call(String listId) =>
      CategorySelectorViewModelProvider._(argument: listId, from: this);

  @override
  String toString() => r'categorySelectorViewModelProvider';
}
