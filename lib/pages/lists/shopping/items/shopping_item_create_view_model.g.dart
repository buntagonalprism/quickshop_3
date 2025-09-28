// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_create_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemAutocompleteHash() => r'cebfbf2689dadb0d9c9e7ecabfed623f377e63b2';

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

/// See also [itemAutocomplete].
@ProviderFor(itemAutocomplete)
const itemAutocompleteProvider = ItemAutocompleteFamily();

/// See also [itemAutocomplete].
class ItemAutocompleteFamily
    extends Family<AsyncValue<List<ShoppingItemAutocomplete>>> {
  /// See also [itemAutocomplete].
  const ItemAutocompleteFamily();

  /// See also [itemAutocomplete].
  ItemAutocompleteProvider call(
    String listId,
  ) {
    return ItemAutocompleteProvider(
      listId,
    );
  }

  @override
  ItemAutocompleteProvider getProviderOverride(
    covariant ItemAutocompleteProvider provider,
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
  String? get name => r'itemAutocompleteProvider';
}

/// See also [itemAutocomplete].
class ItemAutocompleteProvider
    extends AutoDisposeFutureProvider<List<ShoppingItemAutocomplete>> {
  /// See also [itemAutocomplete].
  ItemAutocompleteProvider(
    String listId,
  ) : this._internal(
          (ref) => itemAutocomplete(
            ref as ItemAutocompleteRef,
            listId,
          ),
          from: itemAutocompleteProvider,
          name: r'itemAutocompleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemAutocompleteHash,
          dependencies: ItemAutocompleteFamily._dependencies,
          allTransitiveDependencies:
              ItemAutocompleteFamily._allTransitiveDependencies,
          listId: listId,
        );

  ItemAutocompleteProvider._internal(
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
    FutureOr<List<ShoppingItemAutocomplete>> Function(
            ItemAutocompleteRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemAutocompleteProvider._internal(
        (ref) => create(ref as ItemAutocompleteRef),
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
  AutoDisposeFutureProviderElement<List<ShoppingItemAutocomplete>>
      createElement() {
    return _ItemAutocompleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemAutocompleteProvider && other.listId == listId;
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
mixin ItemAutocompleteRef
    on AutoDisposeFutureProviderRef<List<ShoppingItemAutocomplete>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ItemAutocompleteProviderElement
    extends AutoDisposeFutureProviderElement<List<ShoppingItemAutocomplete>>
    with ItemAutocompleteRef {
  _ItemAutocompleteProviderElement(super.provider);

  @override
  String get listId => (origin as ItemAutocompleteProvider).listId;
}

String _$shoppingItemCreateViewModelHash() =>
    r'4e7525473dae8909994bb72d4f9ed3128cae65e7';

/// See also [ShoppingItemCreateViewModel].
@ProviderFor(ShoppingItemCreateViewModel)
final shoppingItemCreateViewModelProvider = AutoDisposeNotifierProvider<
    ShoppingItemCreateViewModel, ShoppingItemCreateModel>.internal(
  ShoppingItemCreateViewModel.new,
  name: r'shoppingItemCreateViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$shoppingItemCreateViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShoppingItemCreateViewModel
    = AutoDisposeNotifier<ShoppingItemCreateModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
