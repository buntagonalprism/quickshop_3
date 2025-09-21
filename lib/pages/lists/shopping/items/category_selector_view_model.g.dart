// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_selector_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categorySelectorViewModelHash() =>
    r'faa927d031b2c38669c76a7ce67c315afd7421dc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [categorySelectorViewModel].
@ProviderFor(categorySelectorViewModel)
const categorySelectorViewModelProvider = CategorySelectorViewModelFamily();

/// See also [categorySelectorViewModel].
class CategorySelectorViewModelFamily
    extends Family<CategorySelectorViewModel> {
  /// See also [categorySelectorViewModel].
  const CategorySelectorViewModelFamily();

  /// See also [categorySelectorViewModel].
  CategorySelectorViewModelProvider call(
    String listId,
  ) {
    return CategorySelectorViewModelProvider(
      listId,
    );
  }

  @override
  CategorySelectorViewModelProvider getProviderOverride(
    covariant CategorySelectorViewModelProvider provider,
  ) {
    return call(
      provider.listId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categorySelectorViewModelProvider';
}

/// See also [categorySelectorViewModel].
class CategorySelectorViewModelProvider
    extends AutoDisposeProvider<CategorySelectorViewModel> {
  /// See also [categorySelectorViewModel].
  CategorySelectorViewModelProvider(
    String listId,
  ) : this._internal(
          (ref) => categorySelectorViewModel(
            ref as CategorySelectorViewModelRef,
            listId,
          ),
          from: categorySelectorViewModelProvider,
          name: r'categorySelectorViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categorySelectorViewModelHash,
          dependencies: CategorySelectorViewModelFamily._dependencies,
          allTransitiveDependencies:
              CategorySelectorViewModelFamily._allTransitiveDependencies,
          listId: listId,
        );

  CategorySelectorViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
  }) : super.internal();

  final String listId;

  @override
  Override overrideWith(
    CategorySelectorViewModel Function(CategorySelectorViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategorySelectorViewModelProvider._internal(
        (ref) => create(ref as CategorySelectorViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listId: listId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CategorySelectorViewModel> createElement() {
    return _CategorySelectorViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategorySelectorViewModelProvider && other.listId == listId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CategorySelectorViewModelRef
    on AutoDisposeProviderRef<CategorySelectorViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _CategorySelectorViewModelProviderElement
    extends AutoDisposeProviderElement<CategorySelectorViewModel>
    with CategorySelectorViewModelRef {
  _CategorySelectorViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as CategorySelectorViewModelProvider).listId;
}

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
