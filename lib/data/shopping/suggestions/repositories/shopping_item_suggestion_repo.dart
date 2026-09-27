import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/logger.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/firestore.dart';
import '../../../../services/locale_service.dart';
import '../../../../services/shared_preferences.dart';
import '../../../app_database.dart';
import '../../../app_database_provider.dart';
import '../../../common/database/load_progress_table.dart';
import '../models/shopping_item_suggestion.dart';

part 'shopping_item_suggestion_repo.g.dart';

@riverpod
ShoppingItemSuggestionRepo shoppingItemSuggestionRepo(Ref ref) {
  // Suggestions are stored in the per-user database, so only sync them while a user is signed in,
  // and start again when the user changes.
  final userId = ref.watch(userIdProvider);
  final repo = ShoppingItemSuggestionRepo(ref);
  if (userId != null) {
    repo._syncSuggestions();
  }
  ref.onDispose(repo._dispose);
  return repo;
}

class ShoppingItemSuggestionRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider('$ShoppingItemSuggestionRepo'));
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  UserSharedPreferences get _prefs => _ref.read(userSharedPrefsProvider);

  String? _currentLangCode;
  static const _suggestionsLangCodeKey = 'itemSuggestionsLangCode';
  StreamSubscription? _summarySub;

  ShoppingItemSuggestionRepo(this._ref);

  void _syncSuggestions() {
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

  void _dispose() {
    _summarySub?.cancel();
  }

  void _watchSuggestions(String langCode) async {
    final loadProgress =
        await _db.loadProgressDao.get(LoadProgressType.itemSuggestion) ?? DateTime.fromMillisecondsSinceEpoch(0);

    // The user may have changed while loading progress, disposing this repo.
    if (!_ref.mounted) {
      return;
    }

    _summarySub?.cancel();
    _summarySub = _fs.collection('suggestions').doc('items').snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null && _currentLangCode != null) {
          final lastUpdatedTimestamp = data['lastUpdated'][_currentLangCode!] ?? 0;
          final lastUpdated = DateTime.fromMillisecondsSinceEpoch(lastUpdatedTimestamp);
          if (loadProgress.isBefore(lastUpdated)) {
            _log.log('Fetching item suggestions for locale "$_currentLangCode" since $lastUpdated');
            _fetchSuggestions(_currentLangCode!, loadProgress, lastUpdated);
          }
        }
      }
    });
  }

  Future<List<ShoppingItemSuggestion>> searchSuggestions(String query) async {
    final span = _log.startSpan('searchSuggestions');
    final itemSuggestionsData = await _db.suggestionsDao.queryItems(query);
    await span.finish();
    return itemSuggestionsData.map((entry) {
      return ShoppingItemSuggestion(
        id: entry.id,
        name: entry.name,
        langCode: _currentLangCode ?? '',
        category: entry.category,
        popularity: entry.popularity,
      );
    }).toList();
  }

  Future<void> _fetchSuggestions(String langCode, DateTime since, DateTime lastUpdated) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection('suggestions')
        .doc('items')
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

    // The user may have changed while fetching, disposing this repo.
    if (!_ref.mounted || allDocs.isEmpty) {
      return;
    }

    if (_currentLangCode == langCode) {
      await _db.suggestionsDao.insertItems(
        allDocs.map((doc) {
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

      await _prefs.setString(_suggestionsLangCodeKey, langCode);
      await _db.loadProgressDao.save(LoadProgressType.itemSuggestion, lastUpdated);
    }
  }
}
