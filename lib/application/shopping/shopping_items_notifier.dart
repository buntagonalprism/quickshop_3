import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/analytics.dart';
import '../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../models/shopping/shopping_item.dart';
import '../../models/shopping/shopping_item_raw_data.dart';
import '../../repositories/delay_provider_dispose.dart';
import '../../repositories/list_items_transaction.dart';
import '../../repositories/shopping/shopping_items_repo.dart';
import '../../services/shopping_item_name_parser.dart';
import '../../utilities/replace_by_id.dart';
import '../list_leave_in_progress_notifier.dart';
import '../lists_notifier.dart';
import 'autcomplete/shopping_item_autocomplete_use_case.dart';

part 'shopping_items_notifier.freezed.dart';
part 'shopping_items_notifier.g.dart';

@freezed
class AddItemResult with _$AddItemResult {
  const AddItemResult._();

  const factory AddItemResult.success(ShoppingItem item) = _AddItemResultSuccess;
  const factory AddItemResult.categoryRequired() = _AddItemResultCategoryRequired;
  const factory AddItemResult.alreadyOnList(String productName) = _AddItemResultAlreadyOnList;
}

@riverpod
class ShoppingItemsNotifier extends _$ShoppingItemsNotifier {
  @override
  Stream<List<ShoppingItem>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    return ref.watch(shoppingListItemsRepoProvider(listId)).itemsStream;
  }

  Future<ShoppingItem> addItem(ShoppingItemRawData itemData) {
    return _addItem(itemData);
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final items = state.requireValue;
    state = AsyncValue.data(replaceById(items, item.id, (i) => i.copyWith(completed: !i.completed)));
    return ref.read(shoppingListItemsRepoProvider(listId)).toggleItem(item);
  }

  Future<void> deleteItem(ShoppingItem item) async {
    final items = state.requireValue;
    state = AsyncValue.data(
      items.where((i) => i.id != item.id).toList(),
    );

    final tx = ref.read(listItemsTransactionProvider)();
    ref.read(shoppingListItemsRepoProvider(listId)).deleteItems(tx, [item]);
    ref.read(listsProvider.notifier).incrementListItemCount(tx, listId, -1);
    await tx.commit();
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
    final tx = ref.read(listItemsTransactionProvider)();
    ref.read(shoppingListItemsRepoProvider(listId)).deleteItems(tx, deletedItems);
    ref.read(listsProvider.notifier).incrementListItemCount(tx, listId, -deletedItems.length);
    await tx.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemsBatchDeleted());
    return deletedItems.length;
  }

  Future<ShoppingItem> addAutocomplete(ShoppingItemAutocomplete autocomplete) {
    return _addItem(
      ShoppingItemRawData(
        product: autocomplete.product,
        quantity: autocomplete.quantity,
        category: autocomplete.category,
      ),
    );
  }

  Future<ShoppingItem> _addItem(ShoppingItemRawData data) async {
    final tx = ref.read(listItemsTransactionProvider)();
    final item = await ref.read(shoppingListItemsRepoProvider(listId)).addItem(tx, data);
    ref.read(listsProvider.notifier).incrementListItemCount(tx, listId, 1);
    await tx.commit();
    return item;
  }

  Future<AddItemResult> addItemByName(String itemName) async {
    final parser = ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(itemName);
    final product = parsedItem.product.trim().toLowerCase();
    final autocompleteRepo = ref.read(shoppingItemAutocompleteUseCaseProvider(listId));
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

  Future<void> updateItem({
    required ShoppingItem item,
    required String newName,
    required String newQuantity,
    required String newCategory,
  }) async {
    final tx = ref.read(listItemsTransactionProvider)();
    final data = ShoppingItemRawData(
      product: newName,
      quantity: newQuantity,
      category: newCategory,
    );
    final updatedItem = item.copyWith(
      product: newName,
      quantity: newQuantity,
      category: newCategory,
    );
    final items = state.requireValue;
    state = AsyncValue.data(replaceById(items, item.id, (i) => updatedItem));
    ref.read(shoppingListItemsRepoProvider(listId)).updateItem(tx, item, data);
    ref.read(listsProvider.notifier).updateListModified(tx, listId);
    await tx.commit();
  }
}
