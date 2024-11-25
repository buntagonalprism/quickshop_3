import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/checklist_item.dart';
import '../../models/list_summary.dart';
import '../../models/shopping_item.dart';
import '../../repositories/list_item_repo.dart';
import '../../repositories/list_repo.dart';

part 'list_detail_page_state.freezed.dart';
part 'list_detail_page_state.g.dart';

@freezed
class ListDetailPageState with _$ListDetailPageState {
  const ListDetailPageState._();

  const factory ListDetailPageState.error() = _Error;
  const factory ListDetailPageState.loading() = _Loading;
  const factory ListDetailPageState.notFound() = _NotFound;
  const factory ListDetailPageState.shoppingList({
    required ListSummary list,
    required List<ShoppingListPageItem> items,
  }) = _ShoppingList;
  const factory ListDetailPageState.checklist({
    required ListSummary list,
    required List<ChecklistItem> items,
  }) = _Checklist;
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
ListDetailPageState listDetailPageState(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const ListDetailPageState.loading();
  }

  if (listAsyncValue.hasError) {
    return const ListDetailPageState.error();
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const ListDetailPageState.notFound();
  }

  switch (list.listType) {
    case ListType.shoppingList:
      return _shoppingList(ref, list);
    case ListType.checklist:
      return _checklist(ref, list);
  }
}

ListDetailPageState _shoppingList(Ref ref, ListSummary list) {
  final itemsAsyncValue = ref.watch(shoppingListItemRepoProvider(list.id));

  if (itemsAsyncValue.isLoading) {
    return const ListDetailPageState.loading();
  }

  if (itemsAsyncValue.hasError) {
    return const ListDetailPageState.error();
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
    value.sort((a, b) => a.name.compareTo(b.name));
  });
  final categoryKeys = categoryItems.keys.toList()..sort();
  final pageItems = <ShoppingListPageItem>[];
  for (final key in categoryKeys) {
    pageItems.add(ShoppingListPageItem.category(name: key));
    for (final item in categoryItems[key]!) {
      pageItems.add(ShoppingListPageItem.item(item: item));
    }
  }
  return ListDetailPageState.shoppingList(list: list, items: pageItems);
}

ListDetailPageState _checklist(Ref ref, ListSummary list) {
  throw UnimplementedError();
}