import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/logger.dart';
import '../../../../services/firestore.dart';
import '../../../../services/user_prefs_service.dart';
import '../../../app_database.dart';
import '../../../app_database_provider.dart';
import '../../../common/database/load_progress_table.dart';
import '../database/suggestion_type.dart';
import '../models/shopping_item_suggestion.dart';
import 'suggestions_download.dart';

part 'shopping_item_suggestion_repo.g.dart';

@Riverpod(keepAlive: true)
ShoppingItemSuggestionRepo shoppingItemSuggestionRepo(Ref ref) {
  return ShoppingItemSuggestionRepo(ref);
}

class ShoppingItemSuggestionRepo implements SuggestionsDownload {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider('$ShoppingItemSuggestionRepo'));
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  UserPrefsService get _prefs => _ref.read(userPrefsServiceProvider);

  static const _suggestionsLangCodeKey = 'itemSuggestionsLangCode';

  ShoppingItemSuggestionRepo(this._ref);

  @override
  Stream<Map<String, DateTime>> watchLastUpdated() {
    return _fs.collection('suggestions').doc('items').snapshots().map(parseLastUpdated);
  }

  @override
  Future<void> download(String langCode, DateTime lastUpdated) async {
    // Capture the user's database, and read and write their preferences, before any await, so
    // that if the user changes part way through the download finishes against the same user.
    final db = _db;
    if (_prefs.getString(_suggestionsLangCodeKey) != langCode) {
      _prefs.setString(_suggestionsLangCodeKey, langCode);
      await db.clearSuggestions(SuggestionType.item);
    }

    final since =
        await db.loadProgressDao.get(LoadProgressType.itemSuggestion) ?? DateTime.fromMillisecondsSinceEpoch(0);
    if (!since.isBefore(lastUpdated)) {
      return;
    }

    _log.log('Fetching item suggestions for locale "$langCode" since $since');
    final docs = await fetchUpdatedSince(_fs.collection('suggestions').doc('items').collection(langCode), since);
    if (docs.isNotEmpty) {
      await db.suggestionsDao.insertItems(
        docs.map((doc) {
          final data = doc.data()!;
          return ItemSuggestionsRow(
            id: doc.id,
            name: data['name'],
            nameLower: (data['name'] as String).toLowerCase(),
            category: data['category'] as String,
            popularity: data['popularity'] ?? 0,
            hidden: false,
          );
        }).toList(),
      );
    }
    await db.loadProgressDao.save(LoadProgressType.itemSuggestion, lastUpdated);
  }

  Future<List<ShoppingItemSuggestion>> searchSuggestions(String query) async {
    final span = _log.startSpan('searchSuggestions');
    final suggestions = await _db.suggestionsDao.queryItems(query);
    await span.finish();
    return suggestions.map((row) {
      return ShoppingItemSuggestion(
        id: row.id,
        name: row.name,
        langCode: _prefs.getString(_suggestionsLangCodeKey) ?? '',
        category: row.category,
        popularity: row.popularity,
      );
    }).toList();
  }
}
