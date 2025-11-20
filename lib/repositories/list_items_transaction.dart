import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/firestore.dart';

part 'list_items_transaction.g.dart';

@riverpod
ListItemsTransaction Function() listItemsTransaction(Ref ref) {
  return () {
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    return ListItemsTransaction._(batch);
  };
}

class ListItemsTransaction {
  final WriteBatch batch;

  ListItemsTransaction._(this.batch);

  Future<void> commit() {
    return batch.commit();
  }
}
