import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/logger.dart';
import '../models/shopping/history/shopping_category_history.dart';
import '../services/app_database.dart';
import '../services/app_database_provider.dart';
import '../services/firestore.dart';
import '../services/tables/load_progress_table.dart';
import 'user_history_repo.dart';

part 'shopping_category_history_repo.g.dart';

@riverpod
ShoppingCategoryHistoryRepo shoppingCategoryHistoryRepo(Ref ref) {
  return ShoppingCategoryHistoryRepo(ref);
}

class ShoppingCategoryHistoryRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);

  DateTime _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(0);

  ShoppingCategoryHistoryRepo(this._ref) {
    _init();
  }

  void _init() async {
    final progress = await _db.getLoadProgress(LoadProgressType.categoryHistory);
    if (progress != null) {
      _retrievedUntil = progress;
    }

    _ref.listen(userHistoryProvider, (_, historySnap) {
      final userHistory = historySnap.value;
      if (userHistory != null) {
        if (_retrievedUntil.isBefore(userHistory.lastHistoryUpdate)) {
          _fetchHistory(userHistory.userId, _retrievedUntil);
        }
      }
    }, fireImmediately: true);
  }

  Future<List<ShoppingCategoryHistory>> searchHistory(String query) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters

    _log.captureSpan(start, '$ShoppingCategoryHistoryRepo.$searchHistory');
    throw UnimplementedError(
      'ShoppingCategoryHistoryRepo.getHistory is not implemented yet.',
    );
  }

  Future<void> _fetchHistory(String userId, DateTime since) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection('userHistory')
        .doc(userId)
        .collection('categories')
        .where('lastUsed', isGreaterThan: since.millisecondsSinceEpoch)
        .orderBy('lastUsed')
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

    await _db.insertCategoryHistory(
      allDocs.map((doc) {
        final data = doc.data()!;
        return CategoryHistoryRow(
          id: doc.id,
          name: data['name'],
          nameLower: data['nameLower'],
          usageCount: data['usageCount'],
          lastUsed: data['lastUsed'],
        );
      }).toList(),
    );

    _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(
      allDocs.last.data()!['lastUsed'],
    );
    await _db.saveLoadProgress(
      LoadProgressType.categoryHistory,
      _retrievedUntil,
    );
  }
}
