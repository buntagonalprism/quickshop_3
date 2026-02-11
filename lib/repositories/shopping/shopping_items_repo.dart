import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../analytics/analytics.dart';
import '../../models/shopping/shopping_item.dart';
import '../../models/shopping/shopping_item_raw_data.dart';
import '../../services/auth_service.dart';
import '../../services/firestore.dart';
import '../list_items_transaction.dart';

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

  ShoppingItem addItem(ListItemsTransaction tx, ShoppingItemRawData data) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userAuthProvider);
    final item = ShoppingItem(
      id: '',
      path: '',
      product: data.product,
      quantity: data.quantity,
      category: data.category,
      addedByUserId: user!.id,
      lastModifiedByUserId: user.id,
      lastModifiedAt: DateTime.now(),
      completed: false,
    );
    final itemDoc = fs.collection('lists/$listId/items').doc();
    tx.batch.set(itemDoc, _toFirestore(item));
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

  void updateItem(ListItemsTransaction tx, ShoppingItem item, ShoppingItemRawData updatedData) {
    final fs = ref.read(firestoreProvider);
    final itemDoc = fs.doc(item.path);
    tx.batch.update(itemDoc, {
      _Fields.product: updatedData.product,
      _Fields.quantity: updatedData.quantity,
      _Fields.category: updatedData.category,
      _Fields.lastModifiedByUserId: ref.read(userAuthProvider)!.id,
      _Fields.lastModifiedAt: DateTime.now().millisecondsSinceEpoch,
    });
    ref.read(analyticsProvider).logEvent(const AnalyticsEvent.shoppingItemUpdated());
  }

  void deleteItems(ListItemsTransaction tx, List<ShoppingItem> items) {
    final fs = ref.read(firestoreProvider);
    final user = ref.read(userAuthProvider);

    for (final item in items) {
      tx.batch.delete(fs.doc(item.path));
    }

    // Because we want to prioritize offline support, deletes are not performed in a transaction.
    // This means that concurrent deletes could cause the itemCount to be incorrect. Creating this
    // document triggers a cloud function that checks the item count and updates it if needed.
    final deleteDoc = fs.collection('lists/$listId/_itemDeletes').doc();
    tx.batch.set(deleteDoc, {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'userId': user!.id,
      'deletedCount': items.length,
      'items': items.map((item) => _toFirestore(item)).toList(),
    });
  }
}

ShoppingItem _fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
  final data = doc.data()!;
  return ShoppingItem(
    path: doc.reference.path,
    id: doc.id,
    product: data[_Fields.product],
    quantity: data[_Fields.quantity],
    category: data[_Fields.category],
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
    _Fields.category: item.category,
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
  static const String category = 'category';
  static const String addedByUserId = 'addedByUserId';
  static const String lastModifiedByUserId = 'lastModifiedByUserId';
  static const String lastModifiedAt = 'lastModifiedAt';
}
