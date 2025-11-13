import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/history/shopping_item_history.dart';
import '../../../services/app_database.dart';
import '../../../services/app_database_provider.dart';
import '../../../services/firestore.dart';
import '../../../services/tables/load_progress_table.dart';

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

  static final _zeroTime = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _retrievedUntil = _zeroTime;

  ShoppingItemHistoryRepo._(this._ref);

  void onUserHistoryUpdated(String userId, DateTime lastHistoryUpdate) async {
    if (_retrievedUntil == _zeroTime) {
      final progress = await _db.loadProgressDao.get(LoadProgressType.categoryHistory);
      if (progress != null) {
        _retrievedUntil = progress;
      }
    }
    if (_retrievedUntil.isBefore(lastHistoryUpdate)) {
      _fetchHistory(userId, _retrievedUntil);
    }
  }

  Future<List<ShoppingItemHistory>> searchHistory(String query) async {
    final start = DateTime.now();
    final itemHistoryData = await _db.itemHistoryDao.query(query);
    _log.captureSpan(start, '$ShoppingItemHistoryRepo.$searchHistory');
    return itemHistoryData.map((entry) {
      return ShoppingItemHistory(
        id: entry.id,
        name: entry.name,
        nameLower: entry.nameLower,
        usageCount: entry.usageCount,
        lastUsed: DateTime.fromMillisecondsSinceEpoch(entry.lastUsed),
        categories: entry.categories.split('|'),
      );
    }).toList();
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

    await _db.itemHistoryDao.insert(
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
    await _db.loadProgressDao.save(
      LoadProgressType.itemHistory,
      _retrievedUntil,
    );
  }
}
