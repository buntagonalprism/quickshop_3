import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user_profile.dart';
import '../services/auth_service.dart';
import '../services/firestore.dart';
import 'user_profile_transaction.dart';

part 'user_profile_repo.g.dart';

@riverpod
UserProfileRepo userProfileRepo(Ref ref) {
  return UserProfileRepo(ref);
}

class UserProfileRepo {
  final Ref _ref;
  UserProfileRepo(this._ref);

  late UserProfile _cachedUserHistory;
  static const collectionName = 'users';

  Stream<UserProfile?> getProfile() {
    final fs = _ref.read(firestoreProvider);
    final user = _ref.watch(userAuthProvider);
    if (user == null) {
      return Stream.value(null);
    }
    return fs.collection(collectionName).doc(user.id).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        _cachedUserHistory = UserProfile(
          userId: user.id,
          lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(0),
          lastHiddenSuggestionsVersion: 0,
        );
      } else {
        _cachedUserHistory = _fromFirestore(user.id, snapshot);
      }
      return _cachedUserHistory;
    });
  }

  void incrementHiddenSuggestionsVersion(UserProfileTransaction tx) async {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(user.id);

    tx.batch.update(userRef, {
      _Fields.lastHiddenSuggestionsVersion: FieldValue.increment(1),
    });
  }

  void setLastHistoryUpdate(UserProfileTransaction tx, DateTime newUpdateTime) {
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(_cachedUserHistory.userId);
    tx.batch.update(userRef, {
      _Fields.lastHistoryUpdate: newUpdateTime.millisecondsSinceEpoch,
    });
  }

  UserProfile _fromFirestore(String userId, DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserProfile(
      userId: userId,
      lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(data[_Fields.lastHistoryUpdate]),
      lastHiddenSuggestionsVersion: data[_Fields.lastHiddenSuggestionsVersion],
    );
  }
}

class _Fields {
  static const lastHistoryUpdate = 'lastHistoryUpdate';
  static const lastHiddenSuggestionsVersion = 'lastHiddenSuggestionsVersion';
}
