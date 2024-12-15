// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListItemRepoHash() =>
    r'a4f039f3770ee623e283dcbc00a338243787eaf7';

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

abstract class _$ShoppingListItemRepo
    extends BuildlessAutoDisposeStreamNotifier<List<ShoppingItem>> {
  late final String listId;

  Stream<List<ShoppingItem>> build(
    String listId,
  );
}

/// See also [ShoppingListItemRepo].
@ProviderFor(ShoppingListItemRepo)
const shoppingListItemRepoProvider = ShoppingListItemRepoFamily();

/// See also [ShoppingListItemRepo].
class ShoppingListItemRepoFamily
    extends Family<AsyncValue<List<ShoppingItem>>> {
  /// See also [ShoppingListItemRepo].
  const ShoppingListItemRepoFamily();

  /// See also [ShoppingListItemRepo].
  ShoppingListItemRepoProvider call(
    String listId,
  ) {
    return ShoppingListItemRepoProvider(
      listId,
    );
  }

  @override
  ShoppingListItemRepoProvider getProviderOverride(
    covariant ShoppingListItemRepoProvider provider,
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
  String? get name => r'shoppingListItemRepoProvider';
}

/// See also [ShoppingListItemRepo].
class ShoppingListItemRepoProvider
    extends AutoDisposeStreamNotifierProviderImpl<ShoppingListItemRepo,
        List<ShoppingItem>> {
  /// See also [ShoppingListItemRepo].
  ShoppingListItemRepoProvider(
    String listId,
  ) : this._internal(
          () => ShoppingListItemRepo()..listId = listId,
          from: shoppingListItemRepoProvider,
          name: r'shoppingListItemRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingListItemRepoHash,
          dependencies: ShoppingListItemRepoFamily._dependencies,
          allTransitiveDependencies:
              ShoppingListItemRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingListItemRepoProvider._internal(
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
    covariant ShoppingListItemRepo notifier,
  ) {
    return notifier.build(
      listId,
    );
  }

  @override
  Override overrideWith(ShoppingListItemRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShoppingListItemRepoProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<ShoppingListItemRepo,
      List<ShoppingItem>> createElement() {
    return _ShoppingListItemRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListItemRepoProvider && other.listId == listId;
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
mixin ShoppingListItemRepoRef
    on AutoDisposeStreamNotifierProviderRef<List<ShoppingItem>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingListItemRepoProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ShoppingListItemRepo,
        List<ShoppingItem>> with ShoppingListItemRepoRef {
  _ShoppingListItemRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingListItemRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
