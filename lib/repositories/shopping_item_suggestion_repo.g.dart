// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_suggestion_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$shoppingItemSuggestionRepoHash() =>
    r'9a448fd36ada0ee8b675dd1ed6aad993e1c060e8';

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

/// See also [shoppingItemSuggestionRepo].
@ProviderFor(shoppingItemSuggestionRepo)
const shoppingItemSuggestionRepoProvider = ShoppingItemSuggestionRepoFamily();

/// See also [shoppingItemSuggestionRepo].
class ShoppingItemSuggestionRepoFamily
    extends Family<ShoppingItemSuggestionRepo> {
  /// See also [shoppingItemSuggestionRepo].
  const ShoppingItemSuggestionRepoFamily();

  /// See also [shoppingItemSuggestionRepo].
  ShoppingItemSuggestionRepoProvider call(
    String listId,
  ) {
    return ShoppingItemSuggestionRepoProvider(
      listId,
    );
  }

  @override
  ShoppingItemSuggestionRepoProvider getProviderOverride(
    covariant ShoppingItemSuggestionRepoProvider provider,
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
  String? get name => r'shoppingItemSuggestionRepoProvider';
}

/// See also [shoppingItemSuggestionRepo].
class ShoppingItemSuggestionRepoProvider
    extends AutoDisposeProvider<ShoppingItemSuggestionRepo> {
  /// See also [shoppingItemSuggestionRepo].
  ShoppingItemSuggestionRepoProvider(
    String listId,
  ) : this._internal(
          (ref) => shoppingItemSuggestionRepo(
            ref as ShoppingItemSuggestionRepoRef,
            listId,
          ),
          from: shoppingItemSuggestionRepoProvider,
          name: r'shoppingItemSuggestionRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shoppingItemSuggestionRepoHash,
          dependencies: ShoppingItemSuggestionRepoFamily._dependencies,
          allTransitiveDependencies:
              ShoppingItemSuggestionRepoFamily._allTransitiveDependencies,
          listId: listId,
        );

  ShoppingItemSuggestionRepoProvider._internal(
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
    ShoppingItemSuggestionRepo Function(ShoppingItemSuggestionRepoRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ShoppingItemSuggestionRepoProvider._internal(
        (ref) => create(ref as ShoppingItemSuggestionRepoRef),
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
  AutoDisposeProviderElement<ShoppingItemSuggestionRepo> createElement() {
    return _ShoppingItemSuggestionRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemSuggestionRepoProvider &&
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
mixin ShoppingItemSuggestionRepoRef
    on AutoDisposeProviderRef<ShoppingItemSuggestionRepo> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ShoppingItemSuggestionRepoProviderElement
    extends AutoDisposeProviderElement<ShoppingItemSuggestionRepo>
    with ShoppingItemSuggestionRepoRef {
  _ShoppingItemSuggestionRepoProviderElement(super.provider);

  @override
  String get listId => (origin as ShoppingItemSuggestionRepoProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
