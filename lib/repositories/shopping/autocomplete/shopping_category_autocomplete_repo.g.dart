// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_category_autocomplete_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingCategoryAutocompleteRepoHash() =>
    r'82591ed13277c3be38c2266b273a36676322d59c';

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

/// See also [shoppingCategoryAutocompleteRepo].
@ProviderFor(shoppingCategoryAutocompleteRepo)
const shoppingCategoryAutocompleteRepoProvider =
    ShoppingCategoryAutocompleteRepoFamily();

/// See also [shoppingCategoryAutocompleteRepo].
class ShoppingCategoryAutocompleteRepoFamily
    extends Family<ShoppingCategoryAutocompleteRepo> {
  /// See also [shoppingCategoryAutocompleteRepo].
  const ShoppingCategoryAutocompleteRepoFamily();

  /// See also [shoppingCategoryAutocompleteRepo].
  ShoppingCategoryAutocompleteRepoProvider call(
    String listId,
  ) {
    return ShoppingCategoryAutocompleteRepoProvider(
      listId,
    );
  }

  @override
  ShoppingCategoryAutocompleteRepoProvider getProviderOverride(
    covariant ShoppingCategoryAutocompleteRepoProvider provider,
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
  String? get name => r'shoppingCategoryAutocompleteRepoProvider';
}

/// See also [shoppingCategoryAutocompleteRepo].
class ShoppingCategoryAutocompleteRepoProvider
    extends AutoDisposeProvider<ShoppingCategoryAutocompleteRepo> {
  /// See also [shoppingCategoryAutocompleteRepo].
  ShoppingCategoryAutocompleteRepoProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingCategoryAutocompleteRepo(
            ref as ShoppingCategoryAutocompleteRepoRef,
            listId,
          ),
          from: shoppingCategoryAutocompleteRepoProvider,
          name: r'shoppingCategoryAutocompleteRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingCategoryAutocompleteRepoHash,
          dependencies: ShoppingCategoryAutocompleteRepoFamily._dependencies,
          allTransitiveDependencies:
              ShoppingCategoryAutocompleteRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingCategoryAutocompleteRepoProvider._internal(
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
    ShoppingCategoryAutocompleteRepo Function(
            ShoppingCategoryAutocompleteRepoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingCategoryAutocompleteRepoProvider._internal(
        (ref) => create(ref as ShoppingCategoryAutocompleteRepoRef),
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
  AutoDisposeProviderElement<ShoppingCategoryAutocompleteRepo> createElement() {
    return _ShoppingCategoryAutocompleteRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingCategoryAutocompleteRepoProvider &&
        other.listId == listId;
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
mixin ShoppingCategoryAutocompleteRepoRef
    on AutoDisposeProviderRef<ShoppingCategoryAutocompleteRepo> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingCategoryAutocompleteRepoProviderElement
    extends AutoDisposeProviderElement<ShoppingCategoryAutocompleteRepo>
    with ShoppingCategoryAutocompleteRepoRef {
  _ShoppingCategoryAutocompleteRepoProviderElement(super.provider);

  @override
  String get listId =>
      (origin as ShoppingCategoryAutocompleteRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
