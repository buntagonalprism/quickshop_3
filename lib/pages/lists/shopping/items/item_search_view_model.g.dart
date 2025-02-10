// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_search_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemSuggestionsHash() => r'f62d443caefe670ffed12e94d9931451dfb9919c';

/// See also [itemSuggestions].
@ProviderFor(itemSuggestions)
final itemSuggestionsProvider =
    AutoDisposeFutureProvider<List<ItemSuggestion>>.internal(
  itemSuggestions,
  name: r'itemSuggestionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemSuggestionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ItemSuggestionsRef = AutoDisposeFutureProviderRef<List<ItemSuggestion>>;
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
