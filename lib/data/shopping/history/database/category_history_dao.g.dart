// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_history_dao.dart';

// ignore_for_file: type=lint
mixin _$CategoryHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoryHistoryTableTable get categoryHistoryTable =>
      attachedDatabase.categoryHistoryTable;
  CategoryHistoryDaoManager get managers => CategoryHistoryDaoManager(this);
}

class CategoryHistoryDaoManager {
  final _$CategoryHistoryDaoMixin _db;
  CategoryHistoryDaoManager(this._db);
  $$CategoryHistoryTableTableTableManager get categoryHistoryTable =>
      $$CategoryHistoryTableTableTableManager(
        _db.attachedDatabase,
        _db.categoryHistoryTable,
      );
}
