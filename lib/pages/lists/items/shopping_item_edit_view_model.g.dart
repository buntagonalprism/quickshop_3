// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_edit_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemEditViewModelHash() =>
    r'ca357b3251d5c1ebff5c1a97cee8f11045cc8ee7';

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

/// See also [shoppingItemEditViewModel].
@ProviderFor(shoppingItemEditViewModel)
const shoppingItemEditViewModelProvider = ShoppingItemEditViewModelFamily();

/// See also [shoppingItemEditViewModel].
class ShoppingItemEditViewModelFamily
    extends Family<ShoppingItemEditViewModel> {
  /// See also [shoppingItemEditViewModel].
  const ShoppingItemEditViewModelFamily();

  /// See also [shoppingItemEditViewModel].
  ShoppingItemEditViewModelProvider call(
    String listId,
    String itemId,
  ) {
    return ShoppingItemEditViewModelProvider(
      listId,
      itemId,
    );
  }

  @override
  ShoppingItemEditViewModelProvider getProviderOverride(
    covariant ShoppingItemEditViewModelProvider provider,
  ) {
    return call(
      provider.listId,
      provider.itemId,
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
  String? get name => r'shoppingItemEditViewModelProvider';
}

/// See also [shoppingItemEditViewModel].
class ShoppingItemEditViewModelProvider
    extends AutoDisposeProvider<ShoppingItemEditViewModel> {
  /// See also [shoppingItemEditViewModel].
  ShoppingItemEditViewModelProvider(
    String listId,
    String itemId,
  ) : this._internal(
          (ref) => shoppingItemEditViewModel(
            ref as ShoppingItemEditViewModelRef,
            listId,
            itemId,
          ),
          from: shoppingItemEditViewModelProvider,
          name: r'shoppingItemEditViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemEditViewModelHash,
          dependencies: ShoppingItemEditViewModelFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemEditViewModelFamily._allTransitiveDependencies,
          listId: listId,
          itemId: itemId,
        );

  ShoppingItemEditViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
    required this.itemId,
  }) : super.internal();

  final String listId;
  final String itemId;

  @override
  Override overrideWith(
    ShoppingItemEditViewModel Function(ShoppingItemEditViewModelRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemEditViewModelProvider._internal(
        (ref) => create(ref as ShoppingItemEditViewModelRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listId: listId,
        itemId: itemId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ShoppingItemEditViewModel> createElement() {
    return _ShoppingItemEditViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemEditViewModelProvider &&
        other.listId == listId &&
        other.itemId == itemId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ShoppingItemEditViewModelRef
    on AutoDisposeProviderRef<ShoppingItemEditViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;

  /// The parameter `itemId` of this provider.
  String get itemId;
}

class _ShoppingItemEditViewModelProviderElement
    extends AutoDisposeProviderElement<ShoppingItemEditViewModel>
    with ShoppingItemEditViewModelRef {
  _ShoppingItemEditViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingItemEditViewModelProvider).listId;
  @override
  String get itemId => (origin as ShoppingItemEditViewModelProvider).itemId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
