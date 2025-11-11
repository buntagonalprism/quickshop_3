// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_items_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShoppingItemsNotifier)
const shoppingItemsProvider = ShoppingItemsNotifierFamily._();

final class ShoppingItemsNotifierProvider
    extends $StreamNotifierProvider<ShoppingItemsNotifier, List<ShoppingItem>> {
  const ShoppingItemsNotifierProvider._(
      {required ShoppingItemsNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'shoppingItemsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$shoppingItemsNotifierHash();

  @override
  String toString() {
    return r'shoppingItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ShoppingItemsNotifier create() => ShoppingItemsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ShoppingItemsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$shoppingItemsNotifierHash() =>
    r'92d82b8934a71da46604b886429aeeca94614f38';

final class ShoppingItemsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
            ShoppingItemsNotifier,
            AsyncValue<List<ShoppingItem>>,
            List<ShoppingItem>,
            Stream<List<ShoppingItem>>,
            String> {
  const ShoppingItemsNotifierFamily._()
      : super(
          retry: null,
          name: r'shoppingItemsProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  ShoppingItemsNotifierProvider call(
    String listId,
  ) =>
      ShoppingItemsNotifierProvider._(argument: listId, from: this);

  @override
  String toString() => r'shoppingItemsProvider';
}

abstract class _$ShoppingItemsNotifier
    extends $StreamNotifier<List<ShoppingItem>> {
  late final _$args = ref.$arg as String;
  String get listId => _$args;

  Stream<List<ShoppingItem>> build(
    String listId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref =
        this.ref as $Ref<AsyncValue<List<ShoppingItem>>, List<ShoppingItem>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<ShoppingItem>>, List<ShoppingItem>>,
        AsyncValue<List<ShoppingItem>>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
