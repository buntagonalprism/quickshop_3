import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/crash_reporter.dart';
import '../../models/checklist_entry.dart';
import '../../models/list_summary.dart';
import '../../models/shopping_item.dart';
import '../../repositories/list_repo.dart';
import '../../repositories/shopping_list_item_repo.dart';

part 'list_detail_view_model.freezed.dart';
part 'list_detail_view_model.g.dart';

@freezed
class ListDetailViewModel with _$ListDetailViewModel {
  const ListDetailViewModel._();

  const factory ListDetailViewModel.error() = _Error;
  const factory ListDetailViewModel.loading() = _Loading;
  const factory ListDetailViewModel.notFound() = _NotFound;
  const factory ListDetailViewModel.shoppingList({
    required ListSummary list,
    required List<ShoppingListPageItem> items,
  }) = _ShoppingList;
  const factory ListDetailViewModel.checklist({
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
ListDetailViewModel listDetailViewModel(Ref ref, String listId) {
  final listAsyncValue = ref.watch(listProvider(listId));
  if (listAsyncValue.isLoading) {
    return const ListDetailViewModel.loading();
  }

  if (listAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(listAsyncValue);
    return const ListDetailViewModel.error();
  }

  final list = listAsyncValue.requireValue;
  if (list == null) {
    return const ListDetailViewModel.notFound();
  }

  switch (list.listType) {
    case ListType.shoppingList:
      return _shoppingList(ref, list);
    case ListType.checklist:
      return _checklist(ref, list);
  }
}

ListDetailViewModel _shoppingList(Ref ref, ListSummary list) {
  final itemsAsyncValue = ref.watch(shoppingListItemRepoProvider(list.id));

  if (itemsAsyncValue.isLoading) {
    return const ListDetailViewModel.loading();
  }

  if (itemsAsyncValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsAsyncValue);
    return const ListDetailViewModel.error();
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
  return ListDetailViewModel.shoppingList(list: list, items: pageItems);
}

ListDetailViewModel _checklist(Ref ref, ListSummary list) {
  throw UnimplementedError();
}
