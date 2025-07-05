import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user_history.dart';
import '../services/firestore.dart';
import 'user_repo.dart';

part 'user_history_repo.g.dart';

@riverpod
Stream<UserHistory?> userHistory(Ref ref) {
  final fs = ref.read(firestoreProvider);
  final user = ref.watch(userRepoProvider);
  if (user == null) {
    return Stream.value(null);
  }
  return fs.collection('userHistory').doc(user.id).snapshots().map((snapshot) {
    if (!snapshot.exists) {
      return UserHistory(
        userId: user.id,
        lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(0),
        hiddenSuggestions: const HiddenSuggestions(items: [], categories: []),
      );
    }
    return _fromFirestore(user.id, snapshot);
  });
}

UserHistory _fromFirestore(String userId, DocumentSnapshot<Map<String, dynamic>> snapshot) {
  final data = snapshot.data()!;
  return UserHistory(
    userId: userId,
    lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(data['lastHistoryUpdate']),
    hiddenSuggestions: HiddenSuggestions(
      items: (data['hiddenSuggestions']['items'] ?? []).cast<String>(),
      categories: (data['hiddenSuggestions']['categories'] ?? []).cast<String>(),
    ),
  );
}
