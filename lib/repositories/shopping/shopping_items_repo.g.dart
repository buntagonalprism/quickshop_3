// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListItemsHash() => r'2ec81851f6e5bf1757a45b624c29c104c6f94d1e';

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

/// See also [shoppingListItems].
@ProviderFor(shoppingListItems)
const shoppingListItemsProvider = ShoppingListItemsFamily();

/// See also [shoppingListItems].
class ShoppingListItemsFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [shoppingListItems].
  const ShoppingListItemsFamily();

  /// See also [shoppingListItems].
  ShoppingListItemsProvider call(
    String listId,
  ) {
    return ShoppingListItemsProvider(
      listId,
    );
  }

  @override
  ShoppingListItemsProvider getProviderOverride(
    covariant ShoppingListItemsProvider provider,
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
  String? get name => r'shoppingListItemsProvider';
}

/// See also [shoppingListItems].
class ShoppingListItemsProvider
    extends AutoDisposeStreamProvider<List<ShoppingItem>> {
  /// See also [shoppingListItems].
  ShoppingListItemsProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingListItems(
            ref as ShoppingListItemsRef,
            listId,
          ),
          from: shoppingListItemsProvider,
          name: r'shoppingListItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingListItemsHash,
          dependencies: ShoppingListItemsFamily._dependencies,
          allTransitiveDependencies:
              ShoppingListItemsFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingListItemsProvider._internal(
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
    Stream<List<ShoppingItem>> Function(ShoppingListItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingListItemsProvider._internal(
        (ref) => create(ref as ShoppingListItemsRef),
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
  AutoDisposeStreamProviderElement<List<ShoppingItem>> createElement() {
    return _ShoppingListItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListItemsProvider && other.listId == listId;
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
mixin ShoppingListItemsRef on AutoDisposeStreamProviderRef<List<ShoppingItem>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingListItemsProviderElement
    extends AutoDisposeStreamProviderElement<List<ShoppingItem>>
    with ShoppingListItemsRef {
  _ShoppingListItemsProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingListItemsProvider).listId;
}

String _$shoppingListItemsRepoHash() =>
    r'4c5da7c94b6bcad2d0b190a1899def0f6e1a8f19';

/// See also [shoppingListItemsRepo].
@ProviderFor(shoppingListItemsRepo)
const shoppingListItemsRepoProvider = ShoppingListItemsRepoFamily();

/// See also [shoppingListItemsRepo].
class ShoppingListItemsRepoFamily extends Family<ShoppingListItemsRepo> {
  /// See also [shoppingListItemsRepo].
  const ShoppingListItemsRepoFamily();

  /// See also [shoppingListItemsRepo].
  ShoppingListItemsRepoProvider call(
    String listId,
  ) {
    return ShoppingListItemsRepoProvider(
      listId,
    );
  }

  @override
  ShoppingListItemsRepoProvider getProviderOverride(
    covariant ShoppingListItemsRepoProvider provider,
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
  String? get name => r'shoppingListItemsRepoProvider';
}

/// See also [shoppingListItemsRepo].
class ShoppingListItemsRepoProvider
    extends AutoDisposeProvider<ShoppingListItemsRepo> {
  /// See also [shoppingListItemsRepo].
  ShoppingListItemsRepoProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingListItemsRepo(
            ref as ShoppingListItemsRepoRef,
            listId,
          ),
          from: shoppingListItemsRepoProvider,
          name: r'shoppingListItemsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingListItemsRepoHash,
          dependencies: ShoppingListItemsRepoFamily._dependencies,
          allTransitiveDependencies:
              ShoppingListItemsRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingListItemsRepoProvider._internal(
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
    ShoppingListItemsRepo Function(ShoppingListItemsRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingListItemsRepoProvider._internal(
        (ref) => create(ref as ShoppingListItemsRepoRef),
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
  AutoDisposeProviderElement<ShoppingListItemsRepo> createElement() {
    return _ShoppingListItemsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListItemsRepoProvider && other.listId == listId;
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
mixin ShoppingListItemsRepoRef
    on AutoDisposeProviderRef<ShoppingListItemsRepo> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingListItemsRepoProviderElement
    extends AutoDisposeProviderElement<ShoppingListItemsRepo>
    with ShoppingListItemsRepoRef {
  _ShoppingListItemsRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingListItemsRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
