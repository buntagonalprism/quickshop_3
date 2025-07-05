// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_autocomplete_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemAutocompleteRepoHash() =>
    r'86e2f1beabf003c3bb6f4f5172b6c3ae77419030';

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

/// See also [shoppingItemAutocompleteRepo].
@ProviderFor(shoppingItemAutocompleteRepo)
const shoppingItemAutocompleteRepoProvider =
    ShoppingItemAutocompleteRepoFamily();

/// See also [shoppingItemAutocompleteRepo].
class ShoppingItemAutocompleteRepoFamily
    extends Family<ShoppingItemAutocompleteRepo> {
  /// See also [shoppingItemAutocompleteRepo].
  const ShoppingItemAutocompleteRepoFamily();

  /// See also [shoppingItemAutocompleteRepo].
  ShoppingItemAutocompleteRepoProvider call(
    String listId,
  ) {
    return ShoppingItemAutocompleteRepoProvider(
      listId,
    );
  }

  @override
  ShoppingItemAutocompleteRepoProvider getProviderOverride(
    covariant ShoppingItemAutocompleteRepoProvider provider,
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
  String? get name => r'shoppingItemAutocompleteRepoProvider';
}

/// See also [shoppingItemAutocompleteRepo].
class ShoppingItemAutocompleteRepoProvider
    extends AutoDisposeProvider<ShoppingItemAutocompleteRepo> {
  /// See also [shoppingItemAutocompleteRepo].
  ShoppingItemAutocompleteRepoProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingItemAutocompleteRepo(
            ref as ShoppingItemAutocompleteRepoRef,
            listId,
          ),
          from: shoppingItemAutocompleteRepoProvider,
          name: r'shoppingItemAutocompleteRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemAutocompleteRepoHash,
          dependencies: ShoppingItemAutocompleteRepoFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemAutocompleteRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingItemAutocompleteRepoProvider._internal(
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
    ShoppingItemAutocompleteRepo Function(
            ShoppingItemAutocompleteRepoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemAutocompleteRepoProvider._internal(
        (ref) => create(ref as ShoppingItemAutocompleteRepoRef),
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
  AutoDisposeProviderElement<ShoppingItemAutocompleteRepo> createElement() {
    return _ShoppingItemAutocompleteRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemAutocompleteRepoProvider &&
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
mixin ShoppingItemAutocompleteRepoRef
    on AutoDisposeProviderRef<ShoppingItemAutocompleteRepo> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingItemAutocompleteRepoProviderElement
    extends AutoDisposeProviderElement<ShoppingItemAutocompleteRepo>
    with ShoppingItemAutocompleteRepoRef {
  _ShoppingItemAutocompleteRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingItemAutocompleteRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
