import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/analytics.dart';
import '../models/shopping_item.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'list_leave_in_progress_repo.dart';
import 'list_repo.dart';
import 'user_repo.dart';

part 'shopping_list_item_repo.g.dart';

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

  Future<void> addItem({
    required String itemName,
    required String quantity,
    required List<String> categories,
  }) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final item = ShoppingItem(
      id: '',
      path: '',
      name: itemName,
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
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final fs = ref.read(firestoreProvider);
    await fs.doc(item.path).update({
      _Fields.completed: !item.completed,
    });
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
      _Fields.name: newName,
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
  return ShoppingItem(
    path: doc.reference.path,
    id: doc.id,
    name: doc[_Fields.name],
    quantity: doc[_Fields.quantity],
    categories: (doc[_Fields.categories] as List).cast<String>(),
    addedByUserId: doc['addedByUserId'],
    completed: doc[_Fields.completed],
  );
}

Map<String, dynamic> _toFirestore(ShoppingItem item) {
  return {
    _Fields.name: item.name,
    _Fields.quantity: item.quantity,
    _Fields.categories: item.categories,
    'addedByUserId': item.addedByUserId,
    _Fields.completed: item.completed,
  };
}

class _Fields {
  static const String completed = 'completed';
  static const String name = 'name';
  static const String quantity = 'quantity';
  static const String categories = 'categories';
}
