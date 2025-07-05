import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../models/list_summary.dart';
import '../../../models/shopping/shopping_item.dart';
import '../../../repositories/list_repo.dart';
import '../../../repositories/shopping/shopping_item_repo.dart';

part 'shopping_list_view_model.freezed.dart';
part 'shopping_list_view_model.g.dart';

@freezed
class ShoppingListViewModel with _$ShoppingListViewModel {
  const ShoppingListViewModel._();

  const factory ShoppingListViewModel.error() = _Error;
  const factory ShoppingListViewModel.loading() = _Loading;
  const factory ShoppingListViewModel.notFound() = _NotFound;
  const factory ShoppingListViewModel.success({
    required ListSummary list,
    required List<ShoppingListPageItem> items,
  }) = _ShoppingList;
}

@freezed
class ShoppingListPageItem with _$ShoppingListPageItem {
  const factory ShoppingListPageItem.item({
    required ShoppingItem item,
  }) = _Item;
  const factory ShoppingListPageItem.category({
    required String name,
  }) = _Category;
}

@riverpod
ShoppingListViewModel shoppingListViewModel(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const ShoppingListViewModel.loading();
  }

  if (listAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(listAsyncValue);
    return const ShoppingListViewModel.error();
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const ShoppingListViewModel.notFound();
  }

  if (list.listType != ListType.shoppingList) {
    ref.read(crashReporterProvider).report(
          'ShoppingListViewModel was invoked with list id $listId, which is not a shopping list',
          StackTrace.current,
        );
  }

  final itemsAsyncValue = ref.watch(shoppingListItemRepoProvider(list.id));

  if (itemsAsyncValue.isLoading) {
    return const ShoppingListViewModel.loading();
  }

  if (itemsAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsAsyncValue);
    return const ShoppingListViewModel.error();
  }

  final items = itemsAsyncValue.requireValue;
  final categoryItems = <String, List<ShoppingItem>>{};
  for (final item in items) {
    for (final category in item.categories) {
      if (!categoryItems.containsKey(category)) {
        categoryItems[category] = [];
      }
      categoryItems[category]!.add(item);
    }
  }

  categoryItems.forEach((key, value) {
    value.sort((a, b) => a.product.compareTo(b.product));
  });
  final categoryKeys = categoryItems.keys.toList()..sort();
  final pageItems = <ShoppingListPageItem>[];
  for (final key in categoryKeys) {
    pageItems.add(ShoppingListPageItem.category(name: key));
    for (final item in categoryItems[key]!) {
      pageItems.add(ShoppingListPageItem.item(item: item));
    }
  }
  return ShoppingListViewModel.success(list: list, items: pageItems);
}
