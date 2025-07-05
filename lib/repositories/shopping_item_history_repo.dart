import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/logger.dart';
import '../models/shopping/history/shopping_item_history.dart';
import '../services/app_database.dart';
import '../services/app_database_provider.dart';
import '../services/firestore.dart';
import '../services/tables/load_progress_table.dart';
import 'user_history_repo.dart';

part 'shopping_item_history_repo.g.dart';

@riverpod
ShoppingItemHistoryRepo shoppingItemHistoryRepo(Ref ref) {
  return ShoppingItemHistoryRepo._(ref);
}

class ShoppingItemHistoryRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);

  DateTime _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(0);

  ShoppingItemHistoryRepo._(this._ref) {
    _init();
  }

  void _init() async {
    final progress = await _db.getLoadProgress(LoadProgressType.itemHistory);
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

  Future<List<ShoppingItemHistory>> searchHistory(String query) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters

    _log.captureSpan(start, '$ShoppingItemHistoryRepo.$searchHistory');
    throw UnimplementedError(
      'ShoppingCategoryHistoryRepo.getHistory is not implemented yet.',
    );
  }

  Future<void> _fetchHistory(String userId, DateTime since) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection('userHistory')
        .doc(userId)
        .collection('items')
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

    await _db.insertItemHistory(
      allDocs.map((doc) {
        final data = doc.data()!;
        return ItemHistoryRow(
          id: doc.id,
          name: data['name'],
          nameLower: data['nameLower'],
          usageCount: data['usageCount'],
          lastUsed: data['lastUsed'],
          categories: (data['categories'] as List).cast<String>().join('|'),
        );
      }).toList(),
    );

    _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(
      allDocs.last.data()!['lastUsed'],
    );
    await _db.saveLoadProgress(
      LoadProgressType.itemHistory,
      _retrievedUntil,
    );
  }
}
