// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingListViewModelHash() =>
    r'3d1b486dc06840653731d6bdf59d5c1c060f4e9e';

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

/// See also [shoppingListViewModel].
@ProviderFor(shoppingListViewModel)
const shoppingListViewModelProvider = ShoppingListViewModelFamily();

/// See also [shoppingListViewModel].
class ShoppingListViewModelFamily extends Family<ShoppingListViewModel> {
  /// See also [shoppingListViewModel].
  const ShoppingListViewModelFamily();

  /// See also [shoppingListViewModel].
  ShoppingListViewModelProvider call(
    String listId,
  ) {
    return ShoppingListViewModelProvider(
      listId,
    );
  }

  @override
  ShoppingListViewModelProvider getProviderOverride(
    covariant ShoppingListViewModelProvider provider,
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
  String? get name => r'shoppingListViewModelProvider';
}

/// See also [shoppingListViewModel].
class ShoppingListViewModelProvider
    extends AutoDisposeProvider<ShoppingListViewModel> {
  /// See also [shoppingListViewModel].
  ShoppingListViewModelProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingListViewModel(
            ref as ShoppingListViewModelRef,
            listId,
          ),
          from: shoppingListViewModelProvider,
          name: r'shoppingListViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingListViewModelHash,
          dependencies: ShoppingListViewModelFamily._dependencies,
          allTransitiveDependencies:
              ShoppingListViewModelFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingListViewModelProvider._internal(
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
    ShoppingListViewModel Function(ShoppingListViewModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingListViewModelProvider._internal(
        (ref) => create(ref as ShoppingListViewModelRef),
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
  AutoDisposeProviderElement<ShoppingListViewModel> createElement() {
    return _ShoppingListViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingListViewModelProvider && other.listId == listId;
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
mixin ShoppingListViewModelRef
    on AutoDisposeProviderRef<ShoppingListViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingListViewModelProviderElement
    extends AutoDisposeProviderElement<ShoppingListViewModel>
    with ShoppingListViewModelRef {
  _ShoppingListViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingListViewModelProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
