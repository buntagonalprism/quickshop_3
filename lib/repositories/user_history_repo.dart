import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/user_notifier.dart';
import '../models/user/user_history.dart';
import '../services/firestore.dart';

part 'user_history_repo.g.dart';

@riverpod
UserHistoryRepo userHistoryRepo(Ref ref) {
  return UserHistoryRepo(ref);
}

class UserHistoryRepo {
  final Ref _ref;
  UserHistoryRepo(this._ref);

  Stream<UserHistory?> userHistory() {
    final fs = _ref.read(firestoreProvider);
    final user = _ref.watch(userProvider);
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
}
