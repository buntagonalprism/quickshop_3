// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categorySelectorViewModelHash() =>
    r'53e3f6f4bfbb8ad46725b1976bbdf80ab3a636ec';

/// See also [categorySelectorViewModel].
@ProviderFor(categorySelectorViewModel)
final categorySelectorViewModelProvider =
    AutoDisposeProvider<CategorySelectorViewModel>.internal(
  categorySelectorViewModel,
  name: r'categorySelectorViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categorySelectorViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategorySelectorViewModelRef
    = AutoDisposeProviderRef<CategorySelectorViewModel>;
String _$categorySuggestionsHash() =>
    r'cc09fc6a62f0a0ed370c46cbdc035c486a51fc5a';

/// See also [categorySuggestions].
@ProviderFor(categorySuggestions)
final categorySuggestionsProvider = AutoDisposeProvider<List<String>>.internal(
  categorySuggestions,
  name: r'categorySuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categorySuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategorySuggestionsRef = AutoDisposeProviderRef<List<String>>;
String _$categoryFilterHash() => r'e1541cb38ecdbb07e72fb5f47157bd863db23d1a';

/// See also [CategoryFilter].
@ProviderFor(CategoryFilter)
final categoryFilterProvider =
    AutoDisposeNotifierProvider<CategoryFilter, String>.internal(
  CategoryFilter.new,
  name: r'categoryFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoryFilter = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
