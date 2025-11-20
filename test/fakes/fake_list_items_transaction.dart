import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickshop/repositories/list_items_transaction.dart';

import '../mocks/mock_firestore.dart';

class FakeListItemsTransaction implements ListItemsTransaction {
  @override
  WriteBatch get batch => MockBatch();

  @override
  Future<void> commit() async {
    // No-op for fake transaction
  }
}
