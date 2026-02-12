import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../services/auth_service.dart';
import '../../../services/firestore.dart';
import '../../../services/functions_http_client.dart';
import '../../../utilities/parsing_utils.dart';
import '../../firestore_transaction.dart';
import '../models/user_profile.dart';

part 'user_profile_repo.g.dart';

@Riverpod(keepAlive: true)
Stream<UserProfile?> userProfile(Ref ref) {
  ref.watch(userAuthProvider);
  return ref.read(userProfileRepoProvider).getProfile();
}

@Riverpod(keepAlive: true)
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
    final user = _ref.read(userAuthProvider);
    final httpClient = _ref.read(functionsHttpClientProvider);
    if (user == null) {
      return Stream.value(null);
    }
    return fs.collection(collectionName).doc(user.id).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        // This should only be necessary in local debug environments. When running against
        // a deployed Firebase environment, the user document should get auto-created by a
        // Cloud Function triggered on user creation.
        httpClient.put('/createUser');
        _cachedUserHistory = UserProfile(
          userId: user.id,
        );
      } else {
        _cachedUserHistory = _fromFirestore(user.id, snapshot);
      }
      return _cachedUserHistory;
    });
  }

  void incrementHiddenSuggestionsVersion(FirestoreTransaction tx) async {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(user.id);

    tx.batch.update(userRef, {_Fields.hiddenSuggestionsVersion: FieldValue.increment(1)});
  }

  void setLastHistoryUpdate(FirestoreTransaction tx, DateTime newUpdateTime) {
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(_cachedUserHistory.userId);
    tx.batch.update(userRef, {_Fields.lastHistoryUpdate: newUpdateTime.millisecondsSinceEpoch});
  }

  Future<void> setTutorialCompleted(String tutorialId) {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(user.id);

    return userRef.set({
      _Fields.completedTutorials: FieldValue.arrayUnion([tutorialId]),
    });
  }

  UserProfile _fromFirestore(String userId, DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserProfile(
      userId: userId,
      lastHistoryUpdate: dateTimeOrNull(data[_Fields.lastHistoryUpdate]),
      hiddenSuggestionsVersion: data[_Fields.hiddenSuggestionsVersion],
      completedTutorials: listOrNull(data[_Fields.completedTutorials]),
    );
  }
}

class _Fields {
  static const lastHistoryUpdate = 'lastHistoryUpdate';
  static const hiddenSuggestionsVersion = 'hiddenSuggestionsVersion';
  static const completedTutorials = 'completedTutorials';
}
