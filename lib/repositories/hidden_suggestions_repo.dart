import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user/hidden_suggestions.dart';
import '../services/auth_service.dart';
import '../services/firestore.dart';
import '../services/locale_service.dart';
import '../services/shared_preferences.dart';
import 'user_profile_repo.dart';
import 'user_profile_transaction.dart';

part 'hidden_suggestions_repo.g.dart';

@Riverpod(keepAlive: true)
HiddenSuggestionsRepo hiddenSuggestionsRepo(Ref ref) {
  return HiddenSuggestionsRepo(ref);
}

typedef _UserId = String;
typedef _LocaleCode = String;

class HiddenSuggestionsRepo {
  final Ref _ref;
  HiddenSuggestionsRepo(this._ref);

  static const collectionName = 'hidden_suggestions';

  final Map<_UserId, Map<_LocaleCode, HiddenSuggestions>> _cachedSuggestions = {};

  Future<HiddenSuggestions?> getHiddenSuggestions(int expectedVersion) async {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      return null;
    }
    final userId = user.id;
    final locale = _ref.read(localeServiceProvider);

    // Check the memory cache first
    _cachedSuggestions[userId] ??= {};
    final cachedForLocale = _cachedSuggestions[userId]![locale.languageCode];
    if (cachedForLocale != null && cachedForLocale.version >= expectedVersion) {
      return cachedForLocale;
    }

    // Try loading from SharedPreferences next
    final prefs = _ref.read(sharedPrefsProvider);
    final prefsKey = 'hiddenSuggestions_${locale.languageCode}';
    final suggestionsFromPrefsJson = prefs.getString(prefsKey);
    final suggestionsFromPrefs = _parseSuggestionsJson(suggestionsFromPrefsJson);
    if (suggestionsFromPrefs != null && suggestionsFromPrefs.version >= expectedVersion) {
      _cachedSuggestions[userId]![locale.languageCode] = suggestionsFromPrefs;
      return suggestionsFromPrefs;
    }

    // Finally, load from Firestore
    final fs = _ref.read(firestoreProvider);
    final localeHiddenSuggestionsDoc =
        fs.collection(UserProfileRepo.collectionName).doc(user.id).collection(collectionName).doc(locale.languageCode);
    final snapshot = await localeHiddenSuggestionsDoc.get();
    final HiddenSuggestions hiddenSuggestions;
    if (!snapshot.exists) {
      hiddenSuggestions = HiddenSuggestions.empty(locale.languageCode);
    } else {
      final data = snapshot.data()!;
      hiddenSuggestions = HiddenSuggestions(
        locale: data[_Fields.locale],
        version: data[_Fields.version],
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(data[_Fields.lastUpdated]),
        items: (data[_Fields.items] as List<dynamic>).cast<String>(),
        categories: (data[_Fields.categories] as List<dynamic>).cast<String>(),
      );
    }

    _cachedSuggestions[userId]![locale.languageCode] = hiddenSuggestions;
    await prefs.setString(prefsKey, jsonEncode(hiddenSuggestions.toJson()));

    return hiddenSuggestions;
  }

  HiddenSuggestions? _parseSuggestionsJson(String? suggestionsJson) {
    if (suggestionsJson == null) {
      return null;
    }
    try {
      final json = jsonDecode(suggestionsJson) as Map<String, dynamic>;
      return HiddenSuggestions.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  void hideItem(UserProfileTransaction tx, String itemId) {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final locale = _ref.read(localeServiceProvider);
    final fs = _ref.read(firestoreProvider);
    final localeHiddenSuggestionsDoc =
        fs.collection(UserProfileRepo.collectionName).doc(user.id).collection(collectionName).doc(locale.languageCode);

    tx.batch.set(
      localeHiddenSuggestionsDoc,
      _hiddenSuggestionsUpdates(locale, items: [itemId]),
      SetOptions(merge: true),
    );
  }

  void hideCategory(UserProfileTransaction tx, String categoryId) {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final locale = _ref.read(localeServiceProvider);
    final fs = _ref.read(firestoreProvider);
    final localeHiddenSuggestionsDoc =
        fs.collection(UserProfileRepo.collectionName).doc(user.id).collection(collectionName).doc(locale.languageCode);

    tx.batch.set(
      localeHiddenSuggestionsDoc,
      _hiddenSuggestionsUpdates(locale, categories: [categoryId]),
      SetOptions(merge: true),
    );
  }

  Map<String, dynamic> _hiddenSuggestionsUpdates(
    Locale locale, {
    List<String>? items,
    List<String>? categories,
  }) {
    final updates = <String, dynamic>{
      _Fields.locale: locale.languageCode,
      _Fields.version: FieldValue.increment(1),
      _Fields.lastUpdated: DateTime.now().millisecondsSinceEpoch,
    };
    if (items != null) {
      updates[_Fields.items] = FieldValue.arrayUnion(items);
    }
    if (categories != null) {
      updates[_Fields.categories] = FieldValue.arrayUnion(categories);
    }
    return updates;
  }
}

class _Fields {
  static const locale = 'locale';
  static const version = 'version';
  static const lastUpdated = 'lastUpdated';
  static const items = 'items';
  static const categories = 'categories';
}
