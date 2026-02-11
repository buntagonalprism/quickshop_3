import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/history/shopping_item_history.dart';
import '../../../services/app_database.dart';
import '../../../services/app_database_provider.dart';
import '../../../services/auth_service.dart';
import '../../../services/firestore.dart';
import '../../../services/tables/load_progress_table.dart';
import '../../user_profile_repo.dart';
import '../../user_profile_transaction.dart';

part 'shopping_item_history_repo.g.dart';

@Riverpod(keepAlive: true)
ShoppingItemHistoryRepo shoppingItemHistoryRepo(Ref ref) {
  return ShoppingItemHistoryRepo._(ref);
}

class ShoppingItemHistoryRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  String get _userId => _ref.read(userAuthProvider)!.id;

  static final _zeroTime = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _retrievedUntil = _zeroTime;

  static const String collectionName = 'itemHistory';

  ShoppingItemHistoryRepo._(this._ref);

  void onUserHistoryUpdated(DateTime lastHistoryUpdate) async {
    if (_retrievedUntil == _zeroTime) {
      final progress = await _db.loadProgressDao.get(LoadProgressType.categoryHistory);
      if (progress != null) {
        _retrievedUntil = progress;
      }
    }
    if (_retrievedUntil.isBefore(lastHistoryUpdate)) {
      _fetchHistory(_userId, _retrievedUntil);
    }
  }

  Future<void> deleteHistoryEntry(UserProfileTransaction tx, String itemId, DateTime deletedAt) async {
    await _db.itemHistoryDao.deleteById(itemId);
    final docRef = _fs.collection(UserProfileRepo.collectionName).doc(_userId).collection(collectionName).doc(itemId);
    tx.batch.update(docRef, {
      _Fields.deleted: true,
      _Fields.lastUsed: deletedAt.millisecondsSinceEpoch,
    });
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
        category: entry.category,
        deleted: false,
      );
    }).toList();
  }

  Future<void> _fetchHistory(String userId, DateTime since) async {
    const pageSize = 100;
    final baseQuery = _fs
        .collection(UserProfileRepo.collectionName)
        .doc(userId)
        .collection(collectionName)
        .where(_Fields.lastUsed, isGreaterThan: since.millisecondsSinceEpoch)
        .orderBy(_Fields.lastUsed)
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

    final notDeletedDocs = allDocs.where((doc) {
      final data = doc.data()!;
      return data[_Fields.deleted] != true;
    }).toList();

    await _db.itemHistoryDao.insert(
      notDeletedDocs.map((doc) {
        final data = doc.data()!;
        return ItemHistoryRow(
          id: doc.id,
          name: data['name'],
          nameLower: data['nameLower'],
          usageCount: data['usageCount'],
          lastUsed: data[_Fields.lastUsed],
          category: data['category'],
        );
      }).toList(),
    );

    final deletedDocs = allDocs.where((doc) {
      final data = doc.data()!;
      return data[_Fields.deleted] == true;
    }).toList();
    await _db.itemHistoryDao.deleteByIds(deletedDocs.map((doc) => doc.id).toList());

    _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(
      allDocs.last.data()![_Fields.lastUsed],
    );
    await _db.loadProgressDao.save(
      LoadProgressType.itemHistory,
      _retrievedUntil,
    );
  }
}

class _Fields {
  static const lastUsed = 'lastUsed';
  static const deleted = 'deleted';
}
