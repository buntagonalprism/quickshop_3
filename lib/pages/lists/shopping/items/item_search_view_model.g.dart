// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_search_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemSuggestionsHash() => r'a58c901aac2381cd14efc05b081df9fcf1290d0a';

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

/// See also [itemSuggestions].
@ProviderFor(itemSuggestions)
const itemSuggestionsProvider = ItemSuggestionsFamily();

/// See also [itemSuggestions].
class ItemSuggestionsFamily
    extends Family<AsyncValue<List<ShoppingItemSuggestion>>> {
  /// See also [itemSuggestions].
  const ItemSuggestionsFamily();

  /// See also [itemSuggestions].
  ItemSuggestionsProvider call(
    String listId,
  ) {
    return ItemSuggestionsProvider(
      listId,
    );
  }

  @override
  ItemSuggestionsProvider getProviderOverride(
    covariant ItemSuggestionsProvider provider,
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
  String? get name => r'itemSuggestionsProvider';
}

/// See also [itemSuggestions].
class ItemSuggestionsProvider
    extends AutoDisposeFutureProvider<List<ShoppingItemSuggestion>> {
  /// See also [itemSuggestions].
  ItemSuggestionsProvider(
    String listId,
  ) : this._internal(
          (ref) => itemSuggestions(
            ref as ItemSuggestionsRef,
            listId,
          ),
          from: itemSuggestionsProvider,
          name: r'itemSuggestionsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemSuggestionsHash,
          dependencies: ItemSuggestionsFamily._dependencies,
          allTransitiveDependencies:
              ItemSuggestionsFamily._allTransitiveDependencies,
          listId: listId,
        );

  ItemSuggestionsProvider._internal(
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
    FutureOr<List<ShoppingItemSuggestion>> Function(ItemSuggestionsRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemSuggestionsProvider._internal(
        (ref) => create(ref as ItemSuggestionsRef),
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
  AutoDisposeFutureProviderElement<List<ShoppingItemSuggestion>>
      createElement() {
    return _ItemSuggestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemSuggestionsProvider && other.listId == listId;
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
mixin ItemSuggestionsRef
    on AutoDisposeFutureProviderRef<List<ShoppingItemSuggestion>> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ItemSuggestionsProviderElement
    extends AutoDisposeFutureProviderElement<List<ShoppingItemSuggestion>>
    with ItemSuggestionsRef {
  _ItemSuggestionsProviderElement(super.provider);

  @override
  String get listId => (origin as ItemSuggestionsProvider).listId;
}

String _$itemFilterHash() => r'c074d5d919e5da3a73c794d0798466d00ffecec9';

/// See also [ItemFilter].
@ProviderFor(ItemFilter)
final itemFilterProvider =
    AutoDisposeNotifierProvider<ItemFilter, String>.internal(
  ItemFilter.new,
  name: r'itemFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$itemFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemFilter = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
