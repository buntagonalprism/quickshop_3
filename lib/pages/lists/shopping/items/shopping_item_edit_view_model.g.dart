// GENERATED CODE - DO NOT MODIFY BY HAND

// coverage:ignore-file
// dart format off

part of 'shopping_item_edit_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The item being edited, or null if there is no item with [itemId] in the list.

@ProviderFor(item)
final itemProvider = ItemFamily._();

/// The item being edited, or null if there is no item with [itemId] in the list.

final class ItemProvider
    extends
        $FunctionalProvider<
          AsyncValue<ShoppingItem?>,
          AsyncValue<ShoppingItem?>,
          AsyncValue<ShoppingItem?>
        >
    with $Provider<AsyncValue<ShoppingItem?>> {
  /// The item being edited, or null if there is no item with [itemId] in the list.
  ItemProvider._({
    required ItemFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'itemProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$itemHash();

  @override
  String toString() {
    return r'itemProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<AsyncValue<ShoppingItem?>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<ShoppingItem?> create(Ref ref) {
    final argument = this.argument as (String, String);
    return item(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<ShoppingItem?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<ShoppingItem?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$itemHash() => r'a992fddbaca98bfd69dfdd222253e6813b237a30';

/// The item being edited, or null if there is no item with [itemId] in the list.

final class ItemFamily extends $Family
    with
        $FunctionalFamilyOverride<AsyncValue<ShoppingItem?>, (String, String)> {
  ItemFamily._()
    : super(
        retry: null,
        name: r'itemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The item being edited, or null if there is no item with [itemId] in the list.

  ItemProvider call(String listId, String itemId) =>
      ItemProvider._(argument: (listId, itemId), from: this);

  @override
  String toString() => r'itemProvider';
}
