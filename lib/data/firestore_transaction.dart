import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/firestore.dart';

part 'firestore_transaction.g.dart';

@riverpod
FirestoreTransaction Function() firestoreTransaction(Ref ref) {
  return () {
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    return FirestoreTransaction._(batch);
  };
}

class FirestoreTransaction {
  final WriteBatch batch;

  FirestoreTransaction._(this.batch);

  Future<void> commit() {
    return batch.commit();
  }
}
