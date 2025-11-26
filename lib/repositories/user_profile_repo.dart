import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/user_profile.dart';
import '../services/auth_service.dart';
import '../services/firestore.dart';

part 'user_profile_repo.g.dart';

@riverpod
UserProfileRepo userProfileRepo(Ref ref) {
  return UserProfileRepo(ref);
}

class UserProfileRepo {
  final Ref _ref;
  UserProfileRepo(this._ref);

  late UserProfile _cachedUserHistory;
  static const _collectionName = 'userProfiles';

  Stream<UserProfile?> getProfile() {
    final fs = _ref.read(firestoreProvider);
    final user = _ref.watch(userAuthProvider);
    if (user == null) {
      return Stream.value(null);
    }
    return fs.collection(_collectionName).doc(user.id).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        _cachedUserHistory = UserProfile(
          userId: user.id,
          lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(0),
          hiddenSuggestions: const HiddenSuggestions(items: [], categories: []),
        );
      } else {
        _cachedUserHistory = _fromFirestore(user.id, snapshot);
      }
      return _cachedUserHistory;
    });
  }

  Future<void> hideItemSuggestion(String suggestionId) async {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not signed in');
    }
    final fs = _ref.read(firestoreProvider);
    final userHistoryRef = fs.collection(_collectionName).doc(user.id);

    final hiddenItems = _cachedUserHistory.hiddenSuggestions.items.toSet();
    if (hiddenItems.add(suggestionId)) {
      final updatedHistory = _cachedUserHistory.copyWith.hiddenSuggestions(
        items: hiddenItems.toList()..sort(),
      );
      await userHistoryRef.set(_toFirestore(updatedHistory));
    }
  }

  UserProfile _fromFirestore(String userId, DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserProfile(
      userId: userId,
      lastHistoryUpdate: DateTime.fromMillisecondsSinceEpoch(data[_Fields.lastHistoryUpdate]),
      hiddenSuggestions: HiddenSuggestions(
        items: (data[_Fields.hiddenSuggestions][_Fields.items] ?? []).cast<String>(),
        categories: (data[_Fields.hiddenSuggestions][_Fields.categories] ?? []).cast<String>(),
      ),
    );
  }

  Map<String, dynamic> _toFirestore(UserProfile userHistory) {
    return {
      _Fields.lastHistoryUpdate: userHistory.lastHistoryUpdate.millisecondsSinceEpoch,
      _Fields.hiddenSuggestions: {
        _Fields.items: userHistory.hiddenSuggestions.items,
        _Fields.categories: userHistory.hiddenSuggestions.categories,
      },
    };
  }
}

class _Fields {
  static const lastHistoryUpdate = 'lastHistoryUpdate';
  static const hiddenSuggestions = 'hiddenSuggestions';
  static const items = 'items';
  static const categories = 'categories';
}
