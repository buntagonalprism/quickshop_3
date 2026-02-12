import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/app_database.dart';
import '../../../../services/app_database_provider.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/firestore.dart';
import '../../../../services/locale_service.dart';
import '../../../../services/tables/db_preferences_table.dart';
import '../../../../services/tables/suggestion_type.dart';
import '../../../../utilities/parsing_utils.dart';
import '../../../firestore_transaction.dart';
import '../../../user/models/hidden_suggestions.dart';
import '../../../user/repositories/user_profile_repo.dart';

part 'hidden_suggestions_repo.g.dart';

@Riverpod(keepAlive: true)
HiddenSuggestionsRepo hiddenSuggestionsRepo(Ref ref) {
  return HiddenSuggestionsRepo(ref);
}

class HiddenSuggestionsRepo {
  final Ref _ref;
  HiddenSuggestionsRepo(this._ref);

  static const collectionName = 'hiddenSuggestions';

  Future<int> getProcessedHiddenSuggestionsVersion() async {
    final db = _ref.read(appDatabaseProvider);
    final value = await db.getPreference(DbPreferenceKey.processedHiddenSuggestionsVersion);
    return int.tryParse(value ?? '') ?? 0;
  }

  Future<void> fetchAndApplyHiddenSuggestions(int newVersion) async {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      return;
    }
    final locale = _ref.read(localeServiceProvider);

    // Fetch hidden suggestions from Firestore
    final fs = _ref.read(firestoreProvider);
    final localeHiddenSuggestionsDoc = fs
        .collection(UserProfileRepo.collectionName)
        .doc(user.id)
        .collection(collectionName)
        .doc(locale.languageCode);
    final snapshot = await localeHiddenSuggestionsDoc.get();
    final HiddenSuggestions hiddenSuggestions;
    if (!snapshot.exists) {
      hiddenSuggestions = HiddenSuggestions.empty(locale.languageCode);
    } else {
      final data = snapshot.data()!;
      hiddenSuggestions = HiddenSuggestions(
        locale: data[_Fields.locale],
        lastUpdated: DateTime.fromMillisecondsSinceEpoch(data[_Fields.lastUpdated]),
        items: listOrNull(data[_Fields.items]) ?? [],
        categories: listOrNull(data[_Fields.categories]) ?? [],
      );
    }

    // Update local hidden suggestions table
    final db = _ref.read(appDatabaseProvider);
    final hiddenSuggestionRows = <HiddenSuggestionsRow>[];
    for (final itemId in hiddenSuggestions.items) {
      hiddenSuggestionRows.add(
        HiddenSuggestionsRow(
          id: itemId,
          locale: hiddenSuggestions.locale,
          type: SuggestionType.item.value,
        ),
      );
    }
    for (final categoryId in hiddenSuggestions.categories) {
      hiddenSuggestionRows.add(
        HiddenSuggestionsRow(
          id: categoryId,
          locale: hiddenSuggestions.locale,
          type: SuggestionType.category.value,
        ),
      );
    }
    await db.suggestionsDao.replaceAllHiddenSuggestions(hiddenSuggestionRows);

    await db.savePreference(DbPreferenceKey.processedHiddenSuggestionsVersion, newVersion.toString());
  }

  Future<void> hideSuggestionLocally(SuggestionType type, String suggestionId) {
    final db = _ref.read(appDatabaseProvider);
    final locale = _ref.read(localeServiceProvider);
    return db.suggestionsDao.updateHiddenFlag(type, suggestionId, true, locale.languageCode);
  }

  void hideSuggestionRemotely(FirestoreTransaction tx, SuggestionType type, String suggestionId) {
    final user = _ref.read(userAuthProvider);
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final locale = _ref.read(localeServiceProvider);
    final fs = _ref.read(firestoreProvider);
    final localeHiddenSuggestionsDoc = fs
        .collection(UserProfileRepo.collectionName)
        .doc(user.id)
        .collection(collectionName)
        .doc(locale.languageCode);

    tx.batch.set(
      localeHiddenSuggestionsDoc,
      _hiddenSuggestionsDocUpdates(
        locale,
        items: type == SuggestionType.item ? [suggestionId] : null,
        categories: type == SuggestionType.category ? [suggestionId] : null,
      ),
      SetOptions(merge: true),
    );
  }

  Map<String, dynamic> _hiddenSuggestionsDocUpdates(
    Locale locale, {
    List<String>? items,
    List<String>? categories,
  }) {
    final updates = <String, dynamic>{
      _Fields.locale: locale.languageCode,
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
  static const lastUpdated = 'lastUpdated';
  static const items = 'items';
  static const categories = 'categories';
}
