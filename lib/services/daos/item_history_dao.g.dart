// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_history_dao.dart';

// ignore_for_file: type=lint
mixin _$ItemHistoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $ItemHistoryTableTable get itemHistoryTable =>
      attachedDatabase.itemHistoryTable;
  ItemHistoryDaoManager get managers => ItemHistoryDaoManager(this);
}

class ItemHistoryDaoManager {
  final _$ItemHistoryDaoMixin _db;
  ItemHistoryDaoManager(this._db);
  $$ItemHistoryTableTableTableManager get itemHistoryTable =>
      $$ItemHistoryTableTableTableManager(
        _db.attachedDatabase,
        _db.itemHistoryTable,
      );
}
