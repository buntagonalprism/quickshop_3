// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemsNotifierHash() =>
    r'1512320da590a4e7fb0b6d2f3b0206c86407d446';

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

abstract class _$ShoppingItemsNotifier
    extends BuildlessAutoDisposeStreamNotifier<List<ShoppingItem>> {
  late final String listId;

  Stream<List<ShoppingItem>> build(
    String listId,
  );
}

/// See also [ShoppingItemsNotifier].
@ProviderFor(ShoppingItemsNotifier)
const shoppingItemsNotifierProvider = ShoppingItemsNotifierFamily();

/// See also [ShoppingItemsNotifier].
class ShoppingItemsNotifierFamily
    extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [ShoppingItemsNotifier].
  const ShoppingItemsNotifierFamily();

  /// See also [ShoppingItemsNotifier].
  ShoppingItemsNotifierProvider call(
    String listId,
  ) {
    return ShoppingItemsNotifierProvider(
      listId,
    );
  }

  @override
  ShoppingItemsNotifierProvider getProviderOverride(
    covariant ShoppingItemsNotifierProvider provider,
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
  String? get name => r'shoppingItemsNotifierProvider';
}

/// See also [ShoppingItemsNotifier].
class ShoppingItemsNotifierProvider
    extends AutoDisposeStreamNotifierProviderImpl<ShoppingItemsNotifier,
        List<ShoppingItem>> {
  /// See also [ShoppingItemsNotifier].
  ShoppingItemsNotifierProvider(
    String listId,
  ) : this._internal(
          () => ShoppingItemsNotifier()..listId = listId,
          from: shoppingItemsNotifierProvider,
          name: r'shoppingItemsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemsNotifierHash,
          dependencies: ShoppingItemsNotifierFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemsNotifierFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingItemsNotifierProvider._internal(
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
    covariant ShoppingItemsNotifier notifier,
  ) {
    return notifier.build(
      listId,
    );
  }

  @override
  Override overrideWith(ShoppingItemsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemsNotifierProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<ShoppingItemsNotifier,
      List<ShoppingItem>> createElement() {
    return _ShoppingItemsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsNotifierProvider && other.listId == listId;
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
mixin ShoppingItemsNotifierRef
    on AutoDisposeStreamNotifierProviderRef<List<ShoppingItem>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingItemsNotifierProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ShoppingItemsNotifier,
        List<ShoppingItem>> with ShoppingItemsNotifierRef {
  _ShoppingItemsNotifierProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingItemsNotifierProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
