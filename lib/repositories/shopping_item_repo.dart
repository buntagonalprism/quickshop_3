import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/shopping/shopping_item.dart';
import '../models/shopping/suggestions/shopping_item_suggestion.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'list_leave_in_progress_repo.dart';
import 'list_repo.dart';
import 'shopping_item_suggestion_repo.dart';
import 'user_repo.dart';

part 'shopping_item_repo.freezed.dart';
part 'shopping_item_repo.g.dart';

@freezed
class AddItemResult with _$AddItemResult {
  const AddItemResult._();

  const factory AddItemResult.success(ShoppingItem item) = _AddItemResultSuccess;
  const factory AddItemResult.categoryRequired() = _AddItemResultCategoryRequired;
}

@riverpod
class ShoppingListItemRepo extends _$ShoppingListItemRepo {
  @override
  Stream<List<ShoppingItem>> build(String listId) {
    // Stop listening to Firestore when the user leaves the list to avoid permission-denied errors
    if (ref.watch(listLeaveInProgressRepoProvider).contains(listId)) {
      return const Stream.empty();
    }
    ref.delayDispose(const Duration(minutes: 15));
    final fs = ref.watch(firestoreProvider);
    return fs.collection('lists/$listId/items').snapshots().map((snapshot) {
      return snapshot.docs.map(_fromFirestore).toList();
    });
  }

  Future<ShoppingItem> addItem({
    required String productName,
    required String quantity,
    required List<String> categories,
  }) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final item = ShoppingItem(
      id: '',
      path: '',
      product: productName,
      quantity: quantity,
      categories: categories,
      addedByUserId: user!.id,
      lastModifiedByUserId: user.id,
      lastModifiedAt: DateTime.now(),
      completed: false,
    );
    final batch = fs.batch();
    final itemDoc = fs.collection('lists/$listId/items').doc();
    batch.set(itemDoc, _toFirestore(item));
    incrementListItemCount(ref, batch, listId, 1);
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemCreated());
    return item.copyWith(
      id: itemDoc.id,
      path: itemDoc.path,
    );
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final fs = ref.read(firestoreProvider);
    await fs.doc(item.path).update({
      _Fields.completed: !item.completed,
    });
  }

  Future<ShoppingItem> addSuggestion(ShoppingItemSuggestion suggestion) {
    return addItem(
      productName: suggestion.product,
      quantity: suggestion.quantity,
      categories: suggestion.categories,
    );
  }

  Future<AddItemResult> addItemByName(String itemName) async {
    final suggestionRepo = ref.read(shoppingItemSuggestionRepoProvider(listId));
    final suggestion = await suggestionRepo.getExactMatchSuggestionForItem(itemName);
    if (suggestion == null) {
      return const AddItemResult.categoryRequired();
    }
    final item = await addSuggestion(suggestion);
    return AddItemResult.success(item);
  }

  Future<void> deleteItem(ShoppingItem item) async {
    await _deleteItems([item]);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemDeleted());
  }

  Future<void> updateItem({
    required ShoppingItem item,
    required String newName,
    required String newQuantity,
    required List<String> newCategories,
  }) async {
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    final itemDoc = fs.doc(item.path);
    batch.update(itemDoc, {
      _Fields.product: newName,
      _Fields.quantity: newQuantity,
      _Fields.categories: newCategories,
      _Fields.lastModifiedByUserId: ref.read(userRepoProvider)!.id,
      _Fields.lastModifiedAt: DateTime.now().millisecondsSinceEpoch,
    });
    updateListModified(ref, batch, listId);
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemUpdated());
  }

  Future<int> deleteCompletedItems() async {
    final items = state.requireValue;
    final deletedItems = items.where((item) => item.completed).toList();
    if (items.isEmpty) {
      return 0; // No items to delete
    }
    await _deleteItems(deletedItems);
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemsBatchDeleted());
    return deletedItems.length;
  }

  Future<int> _deleteItems(List<ShoppingItem> items) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final batch = fs.batch();

    for (final item in items) {
      batch.delete(fs.doc(item.path));
    }
    incrementListItemCount(ref, batch, listId, -items.length);

    // Because we want to prioritize offline support, deletes are not performed in a transaction.
    // This means that concurrent deletes could cause the itemCount to be incorrect. Creating this
    // document triggers a cloud function that checks the item count and updates it if needed.
    final deleteDoc = fs.collection('lists/$listId/_itemDeletes').doc();
    batch.set(deleteDoc, {
      'timestamp': Timestamp.now(),
      'userId': user!.id,
      'deletedCount': items.length,
      'items': items.map((item) => _toFirestore(item)).toList(),
    });
    await batch.commit();

    return items.length;
  }
}

ShoppingItem _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  final data = doc.data()!;
  return ShoppingItem(
    path: doc.reference.path,
    id: doc.id,
    product: data.containsKey(_Fields.product) ? data[_Fields.product] : data[_Fields.name],
    quantity: data[_Fields.quantity],
    categories: (data[_Fields.categories] as List).cast<String>(),
    addedByUserId: data[_Fields.addedByUserId],
    lastModifiedByUserId: data[_Fields.lastModifiedByUserId],
    lastModifiedAt: (data[_Fields.lastModifiedAt] as Timestamp).toDate(),
    completed: data[_Fields.completed],
  );
}

Map<String, dynamic> _toFirestore(ShoppingItem item) {
  return {
    _Fields.product: item.product,
    _Fields.quantity: item.quantity,
    _Fields.categories: item.categories,
    _Fields.addedByUserId: item.addedByUserId,
    _Fields.lastModifiedByUserId: item.lastModifiedByUserId,
    _Fields.lastModifiedAt: Timestamp.fromDate(item.lastModifiedAt),
    _Fields.completed: item.completed,
  };
}

class _Fields {
  static const String completed = 'completed';
  // TODO: Remove this deprecated 'name' field once migration to 'product' is complete
  @Deprecated('Use product instead')
  static const String name = 'name';
  static const String product = 'product';
  static const String quantity = 'quantity';
  static const String categories = 'categories';
  static const String addedByUserId = 'addedByUserId';
  static const String lastModifiedByUserId = 'lastModifiedByUserId';
  static const String lastModifiedAt = 'lastModifiedAt';
}
