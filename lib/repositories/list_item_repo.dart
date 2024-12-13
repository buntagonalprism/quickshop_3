import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/list_summary.dart';
import '../models/shopping_item.dart';
import '../services/firestore.dart';
import 'delay_provider_dispose.dart';
import 'user_repo.dart';

part 'list_item_repo.g.dart';

@riverpod
class ShoppingListItemRepo extends _$ShoppingListItemRepo {
  @override
  Stream<List<ShoppingItem>> build(String listId) {
    ref.delayDispose(const Duration(minutes: 15));
    final fs = ref.watch(firestoreProvider);
    return fs.collection('lists/$listId/items').snapshots().map((snapshot) {
      return snapshot.docs.map(ShoppingItem.fromFirestore).toList();
    });
  }

  Future<void> addItem({
    required String listId,
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
    final listDoc = fs.doc('lists/$listId');
    batch.set(itemDoc, item.toFirestore());
    batch.update(listDoc, {
      ListSummary.fieldKeys.itemCount: FieldValue.increment(1),
      '${ListSummary.fieldKeys.lastModified}.${user.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
  }

  Future<void> toggleItem(ShoppingItem item) async {
    final fs = ref.read(firestoreProvider);
    await fs.doc(item.path).update({
      ShoppingItem.fieldKeys.completed: !item.completed,
    });
  }

  Future<void> deleteItem(ShoppingItem item) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final listDoc = fs.doc('lists/$listId');
    final batch = fs.batch();
    batch.delete(fs.doc(item.path));
    batch.update(listDoc, {
      ListSummary.fieldKeys.itemCount: FieldValue.increment(-1),
      '${ListSummary.fieldKeys.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
  }

  Future<void> updateItem({
    required ShoppingItem item,
    required String newName,
    required String newQuantity,
    required List<String> newCategories,
  }) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final batch = fs.batch();
    final itemDoc = fs.doc(item.path);
    final listDoc = fs.doc('lists/$listId');
    batch.update(itemDoc, {
      ShoppingItem.fieldKeys.name: newName,
      ShoppingItem.fieldKeys.quantity: newQuantity,
      ShoppingItem.fieldKeys.categories: newCategories,
    });
    batch.update(listDoc, {
      '${ListSummary.fieldKeys.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });
    await batch.commit();
  }

  Future<int> deleteCompletedItems() async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userRepoProvider);
    final itemDocs = await fs.collection('lists/$listId/items').get();
    final items = itemDocs.docs.map(ShoppingItem.fromFirestore);
    final listDoc = fs.doc('lists/$listId');

    final batch = fs.batch();

    int deletedCount = 0;
    for (final item in items) {
      if (item.completed) {
        deletedCount++;
        batch.delete(fs.doc(item.path));
      }
    }
    batch.update(listDoc, {
      ListSummary.fieldKeys.itemCount: FieldValue.increment(-deletedCount),
      '${ListSummary.fieldKeys.lastModified}.${user!.id}': DateTime.now().millisecondsSinceEpoch,
    });

    // Because we want to prioritize offline support, deletes are not performed in a transaction.
    // This means that concurrent deletes could cause the itemCount to be incorrect. Creating this
    // document triggers a cloud function that checks the item count and updates it if needed.
    final deleteDoc = fs.collection('lists/$listId/_itemDeletes').doc();
    batch.set(deleteDoc, {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'userId': user.id,
      'deletedCount': deletedCount
    });
    await batch.commit();
    return deletedCount;
  }
}
