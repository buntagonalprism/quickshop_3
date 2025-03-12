import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/shopping_item.dart';
import '../models/shopping_item_suggestion.dart';
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
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    batch.delete(fs.doc(item.path));
    incrementListItemCount(ref, batch, listId, -1);
    await batch.commit();
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
    });
    updateListModified(ref, batch, listId);
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemUpdated());
  }

  Future<int> deleteCompletedItems() async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final itemDocs = await fs.collection('lists/$listId/items').get();
    final items = itemDocs.docs.map(_fromFirestore);

    final batch = fs.batch();

    int deletedCount = 0;
    for (final item in items) {
      if (item.completed) {
        deletedCount++;
        batch.delete(fs.doc(item.path));
      }
    }
    incrementListItemCount(ref, batch, listId, -deletedCount);

    // Because we want to prioritize offline support, deletes are not performed in a transaction.
    // This means that concurrent deletes could cause the itemCount to be incorrect. Creating this
    // document triggers a cloud function that checks the item count and updates it if needed.
    final deleteDoc = fs.collection('lists/$listId/_itemDeletes').doc();
    batch.set(deleteDoc, {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'userId': user!.id,
      'deletedCount': deletedCount
    });
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemsBatchDeleted());
    return deletedCount;
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
    addedByUserId: data['addedByUserId'],
    completed: data[_Fields.completed],
  );
}

Map<String, dynamic> _toFirestore(ShoppingItem item) {
  return {
    _Fields.product: item.product,
    _Fields.quantity: item.quantity,
    _Fields.categories: item.categories,
    'addedByUserId': item.addedByUserId,
    _Fields.completed: item.completed,
  };
}

class _Fields {
  static const String completed = 'completed';
  // Todo: Remove this deprecated 'name' field once migration to 'product' is complete
  @Deprecated('Use product instead')
  static const String name = 'name';
  static const String product = 'product';
  static const String quantity = 'quantity';
  static const String categories = 'categories';
}
