import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickshop/data/common/application/firestore_transaction.dart';

import '../mocks/mock_firestore.dart';

class FakeListItemsTransaction implements FirestoreTransaction {
  @override
  WriteBatch get batch => MockBatch();

  @override
  Future<void> commit() async {
    // No-op for fake transaction
  }
}
