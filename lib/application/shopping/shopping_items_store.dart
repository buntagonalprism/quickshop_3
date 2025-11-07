import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/analytics.dart';
import '../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../models/shopping/shopping_item.dart';
import '../../repositories/delay_provider_dispose.dart';
import '../../repositories/shopping/autocomplete/shopping_item_autocomplete_repo.dart';
import '../../repositories/shopping/shopping_items_repo.dart';
import '../../services/shopping_item_name_parser.dart';
import '../list_leave_in_progress_store.dart';

part 'shopping_items_store.freezed.dart';
part 'shopping_items_store.g.dart';

@freezed
class AddItemResult with _$AddItemResult {
  const AddItemResult._();

  const factory AddItemResult.success(ShoppingItem item) = _AddItemResultSuccess;
  const factory AddItemResult.categoryRequired() = _AddItemResultCategoryRequired;
  const factory AddItemResult.alreadyOnList(String productName) = _AddItemResultAlreadyOnList;
}

@riverpod
class ShoppingItemsStore extends _$ShoppingItemsStore {
  @override
  Stream<List<ShoppingItem>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressStoreProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    return ref.watch(shoppingListItemsRepoProvider(listId)).itemsStream;
  }

  Future<ShoppingItem> addItem({
    required String productName,
    required String quantity,
    required List<String> categories,
  }) {
    return ref.read(shoppingListItemsRepoProvider(listId)).addItem(
          productName: productName,
          quantity: quantity,
          categories: categories,
        );
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final itemIdx = state.value?.indexWhere((l) => l.id == item.id);
    if (itemIdx != null && itemIdx >= 0) {
      final currentItem = state.value![itemIdx];
      final updatedItem = currentItem.copyWith(completed: !currentItem.completed);
      state = AsyncValue.data([
        updatedItem,
        ...state.value!.where((l) => l.id != item.id),
      ]);
    }
    return ref.read(shoppingListItemsRepoProvider(listId)).toggleItem(item);
  }

  Future<void> deleteItem(ShoppingItem item) async {
    final items = state.requireValue;
    state = AsyncValue.data(
      items.where((i) => i.id != item.id).toList(),
    );
    await ref.read(shoppingListItemsRepoProvider(listId)).deleteItems([item]);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemDeleted());
  }

  Future<int> deleteCompletedItems() async {
    final items = state.requireValue;
    final deletedItems = items.where((item) => item.completed).toList();
    if (items.isEmpty) {
      return 0; // No items to delete
    }
    state = AsyncValue.data(
      items.where((item) => !item.completed).toList(),
    );
    await ref.read(shoppingListItemsRepoProvider(listId)).deleteItems(deletedItems);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemsBatchDeleted());
    return deletedItems.length;
  }

  Future<ShoppingItem> addAutocomplete(ShoppingItemAutocomplete autocomplete) {
    return ref.read(shoppingListItemsRepoProvider(listId)).addItem(
          productName: autocomplete.product,
          quantity: autocomplete.quantity,
          categories: autocomplete.categories,
        );
  }

  Future<AddItemResult> addItemByName(String itemName) async {
    final parser = ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(itemName);
    final product = parsedItem.product.trim().toLowerCase();
    final autocompleteRepo = ref.read(shoppingItemAutocompleteRepoProvider(listId));
    final autocompleteOptions = await autocompleteRepo.getAutocomplete(product);
    ShoppingItemAutocomplete? autocomplete;
    for (var option in autocompleteOptions) {
      if (option.product.toLowerCase() == product) {
        autocomplete = option;
        break;
      }
    }
    if (autocomplete == null) {
      return const AddItemResult.categoryRequired();
    }
    if (autocomplete.source == ShoppingItemAutocompleteSource.list) {
      return AddItemResult.alreadyOnList(autocomplete.product);
    }
    final item = await addAutocomplete(autocomplete);
    return AddItemResult.success(item);
  }
}
