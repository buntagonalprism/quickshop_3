import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../data/lists/application/list_provider.dart';
import '../../../data/shopping/items/application/shopping_items_notifier.dart';
import '../../../data/lists/models/list_summary.dart';
import '../../../data/shopping/items/models/shopping_item.dart';

part 'shopping_list_view_model.freezed.dart';
part 'shopping_list_view_model.g.dart';

@freezed
abstract class ShoppingList with _$ShoppingList {
  const factory ShoppingList({
    required ListSummary list,
    required List<ShoppingListRow> rows,
  }) = _ShoppingList;
}

/// A row on the shopping list page: either an item, or the header of the category below it.
@freezed
sealed class ShoppingListRow with _$ShoppingListRow {
  const factory ShoppingListRow.item({
    required ShoppingItem item,
  }) = _Item;
  const factory ShoppingListRow.category({
    required String name,
  }) = _Category;
}

/// The shopping list with [listId] and its items grouped by category, or null if there is no such
/// list.
@riverpod
AsyncValue<ShoppingList?> shoppingList(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const AsyncLoading();
  }

  if (listAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(listAsyncValue);
    return AsyncError(listAsyncValue.error!, listAsyncValue.stackTrace!);
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const AsyncData(null);
  }

  if (list.listType != ListType.shoppingList) {
    ref
        .read(crashReporterProvider)
        .report(
          'shoppingListProvider was invoked with list id $listId, which is not a shopping list',
          StackTrace.current,
        );
  }

  final itemsAsyncValue = ref.watch(shoppingItemsProvider(list.id));

  if (itemsAsyncValue.isLoading) {
    return const AsyncLoading();
  }

  if (itemsAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsAsyncValue);
    return AsyncError(itemsAsyncValue.error!, itemsAsyncValue.stackTrace!);
  }

  final items = itemsAsyncValue.requireValue;
  final categoryItems = <String, List<ShoppingItem>>{};
  for (final item in items) {
    final category = item.category;
    if (!categoryItems.containsKey(category)) {
      categoryItems[category] = [];
    }
    categoryItems[category]!.add(item);
  }

  categoryItems.forEach((key, value) {
    value.sort((a, b) => a.product.compareTo(b.product));
  });
  final categoryKeys = categoryItems.keys.toList()..sort();
  final rows = <ShoppingListRow>[];
  for (final key in categoryKeys) {
    rows.add(ShoppingListRow.category(name: key));
    for (final item in categoryItems[key]!) {
      rows.add(ShoppingListRow.item(item: item));
    }
  }
  return AsyncData(ShoppingList(list: list, rows: rows));
}
