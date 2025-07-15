import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/suggestions/shopping_category_suggestion.dart';
import '../../../services/app_database.dart';
import '../../../services/app_database_provider.dart';
import '../../../services/firestore.dart';
import '../../../services/locale_service.dart';
import '../../../services/shared_preferences.dart';
import '../../../services/tables/load_progress_table.dart';

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

  DateTime _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(0);

  String? _locale;
  StreamSubscription? _summarySub;

  ShoppingCategorySuggestionRepo(this._ref) {
    _locale = _prefs.getString('retrievedSuggestionsLocale');
    _ref.listen(
      localeServiceProvider,
      (_, locale) async {
        final newLocale = locale.countryCode!;
        if (_locale != newLocale) {
          _locale = newLocale;

          await _db.clearAllSuggestions();
          _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(0);
          _init();
        }
      },
      fireImmediately: true,
    );
    _init();
  }

  void _init() async {
    final progress = await _db.getLoadProgress(LoadProgressType.categorySuggestion);
    if (progress != null) {
      _retrievedUntil = progress;
    }

    _summarySub?.cancel();
    _summarySub = _fs.collection('suggestions').doc('categories').snapshots().listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        if (data != null) {
          if (_locale == null) {
            final lastUpdatedForLocale =
                data['lastUpdated'][_locale!] ?? DateTime.fromMillisecondsSinceEpoch(0);
            if (_retrievedUntil.isBefore(lastUpdatedForLocale)) {
              _fetchSuggestions(_locale!, _retrievedUntil, lastUpdatedForLocale);
            }
          }
        }
      }
    });
  }

  Future<List<ShoppingCategorySuggestion>> searchSuggestions(String query) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters

    _log.captureSpan(start, '$ShoppingCategorySuggestionRepo.$searchSuggestions');
    throw UnimplementedError('not implemented yet.');
  }

  Future<void> _fetchSuggestions(String locale, DateTime since, DateTime lastUpdated) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection('suggestions')
        .doc('categories')
        .collection(locale)
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

    if (_locale == locale) {
      await _db.insertCategorySuggestions(
        allDocs.map((doc) {
          final data = doc.data()!;
          return CategorySuggestionsRow(
            id: doc.id,
            name: data['name'],
            nameLower: data['nameLower'],
          );
        }).toList(),
      );

      _retrievedUntil = lastUpdated;
      _prefs.setString('retrievedSuggestionsLocale', locale);
      await _db.saveLoadProgress(
        LoadProgressType.categorySuggestion,
        _retrievedUntil,
      );
    }
  }
}
