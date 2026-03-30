import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore.dart';
import '../../../services/functions_http_client.dart';
import '../../../utilities/parsing_utils.dart';
import '../../common/application/firestore_transaction.dart';
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

  late UserProfile _cachedUserProfile;
  static const collectionName = 'users';
  late final _log = _ref.read(loggerProvider('$UserProfileRepo'));

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
        _log.log('Creating user');
        httpClient.put('/createUser');
        _cachedUserProfile = UserProfile(
          userId: user.id,
        );
      } else {
        _cachedUserProfile = _fromFirestore(user.id, snapshot);
      }
      return _cachedUserProfile;
    });
  }

  void incrementHiddenSuggestionsVersion(FirestoreTransaction tx) async {
    _log.log('Incrementing hidden suggestions vesion, was: ${_cachedUserProfile.hiddenSuggestionsVersion}');
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(user.id);

    tx.batch.update(userRef, {_Fields.hiddenSuggestionsVersion: FieldValue.increment(1)});
  }

  void setLastHistoryUpdate(FirestoreTransaction tx, DateTime newUpdateTime) {
    _log.log('Setting last history update: $newUpdateTime');
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(_cachedUserProfile.userId);
    tx.batch.update(userRef, {_Fields.lastHistoryUpdate: newUpdateTime.millisecondsSinceEpoch});
  }

  Future<void> setTutorialCompleted(String tutorialId) {
    _log.log('Setting tutorial completed: $tutorialId');
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userRef = fs.collection(collectionName).doc(user.id);

    return userRef.update({
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
