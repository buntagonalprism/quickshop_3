import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/analytics.dart';
import '../../models/shopping/shopping_item.dart';
import '../../services/auth_service.dart';
import '../../services/firestore.dart';
import '../list_repo.dart';

part 'shopping_items_repo.g.dart';

@riverpod
ShoppingListItemsRepo shoppingListItemsRepo(Ref ref, String listId) {
  return ShoppingListItemsRepo(listId: listId, ref: ref);
}

class ShoppingListItemsRepo {
  final String listId;
  final Ref ref;

  ShoppingListItemsRepo({required this.listId, required this.ref});

  Stream<List<ShoppingItem>> get itemsStream {
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
    final user = ref.read(authUserProvider);
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
      _Fields.lastModifiedByUserId: ref.read(authUserProvider)!.id,
      _Fields.lastModifiedAt: DateTime.now().millisecondsSinceEpoch,
    });
    updateListModified(ref, batch, listId);
    await batch.commit();
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemUpdated());
  }

  Future<int> deleteItems(List<ShoppingItem> items) async {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(authUserProvider);
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
      'timestamp': DateTime.now().millisecondsSinceEpoch,
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
    product: data[_Fields.product],
    quantity: data[_Fields.quantity],
    categories: (data[_Fields.categories] as List).cast<String>(),
    addedByUserId: data[_Fields.addedByUserId],
    lastModifiedByUserId: data[_Fields.lastModifiedByUserId],
    lastModifiedAt: DateTime.fromMillisecondsSinceEpoch(data[_Fields.lastModifiedAt]),
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
    _Fields.lastModifiedAt: item.lastModifiedAt.millisecondsSinceEpoch,
    _Fields.completed: item.completed,
  };
}

class _Fields {
  static const String completed = 'completed';
  static const String product = 'product';
  static const String quantity = 'quantity';
  static const String categories = 'categories';
  static const String addedByUserId = 'addedByUserId';
  static const String lastModifiedByUserId = 'lastModifiedByUserId';
  static const String lastModifiedAt = 'lastModifiedAt';
}
