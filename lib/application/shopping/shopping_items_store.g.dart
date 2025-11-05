// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemsStoreHash() =>
    r'c58116dd11bf26e494a0c4954b8e86e6ec667feb';

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

abstract class _$ShoppingItemsStore
    extends BuildlessAutoDisposeStreamNotifier<List<ShoppingItem>> {
  late final String listId;

  Stream<List<ShoppingItem>> build(
    String listId,
  );
}

/// See also [ShoppingItemsStore].
@ProviderFor(ShoppingItemsStore)
const shoppingItemsStoreProvider = ShoppingItemsStoreFamily();

/// See also [ShoppingItemsStore].
class ShoppingItemsStoreFamily extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [ShoppingItemsStore].
  const ShoppingItemsStoreFamily();

  /// See also [ShoppingItemsStore].
  ShoppingItemsStoreProvider call(
    String listId,
  ) {
    return ShoppingItemsStoreProvider(
      listId,
    );
  }

  @override
  ShoppingItemsStoreProvider getProviderOverride(
    covariant ShoppingItemsStoreProvider provider,
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
  String? get name => r'shoppingItemsStoreProvider';
}

/// See also [ShoppingItemsStore].
class ShoppingItemsStoreProvider extends AutoDisposeStreamNotifierProviderImpl<
    ShoppingItemsStore, List<ShoppingItem>> {
  /// See also [ShoppingItemsStore].
  ShoppingItemsStoreProvider(
    String listId,
  ) : this._internal(
          () => ShoppingItemsStore()..listId = listId,
          from: shoppingItemsStoreProvider,
          name: r'shoppingItemsStoreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemsStoreHash,
          dependencies: ShoppingItemsStoreFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemsStoreFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingItemsStoreProvider._internal(
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
  Stream<List<ShoppingItem>> runNotifierBuild(
    covariant ShoppingItemsStore notifier,
  ) {
    return notifier.build(
      listId,
    );
  }

  @override
  Override overrideWith(ShoppingItemsStore Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemsStoreProvider._internal(
        () => create()..listId = listId,
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
  AutoDisposeStreamNotifierProviderElement<ShoppingItemsStore,
      List<ShoppingItem>> createElement() {
    return _ShoppingItemsStoreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsStoreProvider && other.listId == listId;
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
mixin ShoppingItemsStoreRef
    on AutoDisposeStreamNotifierProviderRef<List<ShoppingItem>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingItemsStoreProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ShoppingItemsStore,
        List<ShoppingItem>> with ShoppingItemsStoreRef {
  _ShoppingItemsStoreProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingItemsStoreProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
