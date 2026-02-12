import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/logger.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/firestore.dart';
import '../../../app_database.dart';
import '../../../app_database_provider.dart';
import '../../../common/application/firestore_transaction.dart';
import '../../../common/database/load_progress_table.dart';
import '../../../user/repositories/user_profile_repo.dart';
import '../models/shopping_category_history.dart';

part 'shopping_category_history_repo.g.dart';

@Riverpod(keepAlive: true)
ShoppingCategoryHistoryRepo shoppingCategoryHistoryRepo(Ref ref) {
  return ShoppingCategoryHistoryRepo._(ref);
}

class ShoppingCategoryHistoryRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);
  FirebaseFirestore get _fs => _ref.read(firestoreProvider);
  String get _userId => _ref.read(userAuthProvider)!.id;

  static final _zeroTime = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _retrievedUntil = _zeroTime;

  static const String collectionName = 'categoryHistory';

  ShoppingCategoryHistoryRepo._(this._ref);

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

  void deleteHistoryEntry(FirestoreTransaction tx, String itemId, DateTime deletedAt) {
    _db.categoryHistoryDao.deleteById(itemId);
    final docRef = _fs.collection(UserProfileRepo.collectionName).doc(_userId).collection(collectionName).doc(itemId);
    tx.batch.update(docRef, {
      _Fields.deleted: true,
      _Fields.lastUsed: deletedAt.millisecondsSinceEpoch,
    });
  }

  Future<List<ShoppingCategoryHistory>> searchHistory(String query) async {
    final start = DateTime.now();
    final categoryHistory = await _db.categoryHistoryDao.query(query);
    _log.captureSpan(start, '$ShoppingCategoryHistoryRepo.$searchHistory');
    return categoryHistory.map((row) {
      return ShoppingCategoryHistory(
        id: row.id,
        name: row.name,
        nameLower: row.nameLower,
        usageCount: row.usageCount,
        lastUsed: DateTime.fromMillisecondsSinceEpoch(row.lastUsed),
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

    await _db.categoryHistoryDao.insert(
      notDeletedDocs.map((doc) {
        final data = doc.data()!;
        return CategoryHistoryRow(
          id: doc.id,
          name: data['name'],
          nameLower: data['nameLower'],
          usageCount: data['usageCount'],
          lastUsed: data[_Fields.lastUsed],
        );
      }).toList(),
    );

    final deletedDocs = allDocs.where((doc) {
      final data = doc.data()!;
      return data[_Fields.deleted] == true;
    }).toList();
    await _db.categoryHistoryDao.deleteByIds(deletedDocs.map((doc) => doc.id).toList());

    _retrievedUntil = DateTime.fromMillisecondsSinceEpoch(
      allDocs.last.data()!['lastUsed'],
    );
    await _db.loadProgressDao.save(
      LoadProgressType.categoryHistory,
      _retrievedUntil,
    );
  }
}

class _Fields {
  static const String lastUsed = 'lastUsed';
  static const String deleted = 'deleted';
}
