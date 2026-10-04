import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/crash_reporter.dart';
import '../../../../data/shopping/items/application/shopping_items_notifier.dart';
import '../../../../data/shopping/items/models/shopping_item.dart';

part 'shopping_item_edit_view_model.g.dart';

/// The item being edited, or null if there is no item with [itemId] in the list.
@riverpod
AsyncValue<ShoppingItem?> item(Ref ref, String listId, String itemId) {
  final itemsValue = ref.watch(shoppingItemsProvider(listId));
  if (itemsValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsValue);
    return AsyncError(itemsValue.error!, itemsValue.stackTrace!);
  }
  if (itemsValue.isLoading) {
    return const AsyncLoading();
  }
  final items = itemsValue.value!;
  return AsyncData(items.firstWhereOrNull((item) => item.id == itemId));
}
