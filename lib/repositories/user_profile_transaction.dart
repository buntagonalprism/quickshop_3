import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/firestore.dart';

part 'user_profile_transaction.g.dart';

@riverpod
UserProfileTransaction Function() userProfileTransaction(Ref ref) {
  return () {
    final fs = ref.read(firestoreProvider);
    final batch = fs.batch();
    return UserProfileTransaction._(batch);
  };
}

class UserProfileTransaction {
  final WriteBatch batch;

  UserProfileTransaction._(this.batch);

  Future<void> commit() {
    return batch.commit();
  }
}
