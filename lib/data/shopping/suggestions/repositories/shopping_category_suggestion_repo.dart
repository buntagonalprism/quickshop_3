import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../analytics/logger.dart';
import '../../../../services/firestore.dart';
import '../../../../services/locale_service.dart';
import '../../../../services/shared_preferences.dart';
import '../../../app_database.dart';
import '../../../app_database_provider.dart';
import '../../../common/database/load_progress_table.dart';
import '../models/shopping_category_suggestion.dart';

part 'shopping_category_suggestion_repo.g.dart';

@riverpod
ShoppingCategorySuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  return ShoppingCategorySuggestionRepo(ref);
}

class ShoppingCategorySuggestionRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  SharedPreferencesWithCache get _prefs => _ref.read(sharedPrefsProvider);

  String? _currentLangCode;
  static const _suggestionsLangCodeKey = 'categorySuggestionsLangCode';
  StreamSubscription? _summarySub;

  ShoppingCategorySuggestionRepo(this._ref) {
    _currentLangCode = _prefs.getString(_suggestionsLangCodeKey);
    _ref.listen(
      localeServiceProvider,
      (_, locale) async {
        final newLangCode = locale.languageCode;
        if (_currentLangCode != newLangCode) {
          _currentLangCode = newLangCode;

          await _db.clearAllSuggestions();
        }
        _watchSuggestions(newLangCode);
      },
      fireImmediately: true,
    );
  }

  void _watchSuggestions(String langCode) async {
    final loadProgress =
        await _db.loadProgressDao.get(LoadProgressType.categorySuggestion) ?? DateTime.fromMillisecondsSinceEpoch(0);

    _summarySub?.cancel();
    _summarySub = _fs.collection('suggestions').doc('categories').snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null && _currentLangCode != null) {
          final lastUpdatedTimestamp = data['lastUpdated'][_currentLangCode!] ?? 0;
          final lastUpdated = DateTime.fromMillisecondsSinceEpoch(lastUpdatedTimestamp);
          if (loadProgress.isBefore(lastUpdated)) {
            _fetchSuggestions(_currentLangCode!, loadProgress, lastUpdated);
          }
        }
      }
    });
  }

  Future<List<ShoppingCategorySuggestion>> searchSuggestions(String query) async {
    final start = DateTime.now();
    final suggestions = await _db.suggestionsDao.queryCategories(query);
    _log.captureSpan(start, '$ShoppingCategorySuggestionRepo.$searchSuggestions');
    return suggestions.map((row) {
      return ShoppingCategorySuggestion(
        id: row.id,
        name: row.name,
        popularity: row.popularity,
      );
    }).toList();
  }

  Future<void> _fetchSuggestions(String langCode, DateTime since, DateTime lastUpdated) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection('suggestions')
        .doc('categories')
        .collection(langCode)
        .where('updated', isGreaterThan: since.millisecondsSinceEpoch)
        .orderBy('updated')
        .orderBy(FieldPath.documentId)
        .limit(pageSize);

    Query<Map<String, dynamic>> pageQuery = baseQuery;
    List<DocumentSnapshot<Map<String, dynamic>>> allDocs = [];
    QuerySnapshot<Map<String, dynamic>> pageResults;
    do {
      pageResults = await pageQuery.get();
      allDocs.addAll(pageResults.docs);
      if (pageResults.docs.isNotEmpty) {
        pageQuery = baseQuery.startAfterDocument(pageResults.docs.last);
      }
    } while (pageResults.size == pageSize);

    if (allDocs.isEmpty) {
      return;
    }

    if (_currentLangCode == langCode) {
      await _db.suggestionsDao.insertCategories(
        allDocs.map((doc) {
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

      await _prefs.setString(_suggestionsLangCodeKey, langCode);
      await _db.loadProgressDao.save(LoadProgressType.categorySuggestion, lastUpdated);
    }
  }
}
