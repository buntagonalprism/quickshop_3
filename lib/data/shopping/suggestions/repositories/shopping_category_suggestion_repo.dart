import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/logger.dart';
import '../../../../services/firestore.dart';
import '../../../../services/user_prefs_service.dart';
import '../../../app_database.dart';
import '../../../app_database_provider.dart';
import '../../../common/database/load_progress_table.dart';
import '../database/suggestion_type.dart';
import '../models/shopping_category_suggestion.dart';
import 'suggestions_download.dart';

part 'shopping_category_suggestion_repo.g.dart';

@Riverpod(keepAlive: true)
ShoppingCategorySuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  return ShoppingCategorySuggestionRepo(ref);
}

class ShoppingCategorySuggestionRepo implements SuggestionsDownload {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider('$ShoppingCategorySuggestionRepo'));
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  UserPrefsService get _prefs => _ref.read(userPrefsServiceProvider);

  static const _suggestionsLangCodeKey = 'categorySuggestionsLangCode';

  ShoppingCategorySuggestionRepo(this._ref);

  @override
  Stream<Map<String, DateTime>> watchLastUpdated() {
    return _fs.collection('suggestions').doc('categories').snapshots().map(parseLastUpdated);
  }

  @override
  Future<void> download(String langCode, DateTime lastUpdated) async {
    // Capture the user's database, and read and write their preferences, before any await, so
    // that if the user changes part way through the download finishes against the same user.
    final db = _db;
    if (_prefs.getString(_suggestionsLangCodeKey) != langCode) {
      _prefs.setString(_suggestionsLangCodeKey, langCode);
      await db.clearSuggestions(SuggestionType.category);
    }

    final since =
        await db.loadProgressDao.get(LoadProgressType.categorySuggestion) ?? DateTime.fromMillisecondsSinceEpoch(0);
    if (!since.isBefore(lastUpdated)) {
      return;
    }

    _log.log('Fetching category suggestions for locale "$langCode" since $since');
    final docs = await fetchUpdatedSince(_fs.collection('suggestions').doc('categories').collection(langCode), since);
    if (docs.isNotEmpty) {
      await db.suggestionsDao.insertCategories(
        docs.map((doc) {
          final data = doc.data()!;
          return CategorySuggestionsRow(
            id: doc.id,
            name: data['name'],
            nameLower: (data['name'] as String).toLowerCase(),
            popularity: data['popularity'] ?? 0,
            hidden: false,
          );
        }).toList(),
      );
    }
    await db.loadProgressDao.save(LoadProgressType.categorySuggestion, lastUpdated);
  }

  Future<List<ShoppingCategorySuggestion>> searchSuggestions(String query) async {
    final span = _log.startSpan('searchSuggestions');
    final suggestions = await _db.suggestionsDao.queryCategories(query);
    await span.finish();
    return suggestions.map((row) {
      return ShoppingCategorySuggestion(
        id: row.id,
        name: row.name,
        popularity: row.popularity,
      );
    }).toList();
  }
}
