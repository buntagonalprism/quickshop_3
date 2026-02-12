// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'load_progress_dao.dart';

// ignore_for_file: type=lint
mixin _$LoadProgressDaoMixin on DatabaseAccessor<AppDatabase> {
  $LoadProgressTableTable get loadProgressTable =>
      attachedDatabase.loadProgressTable;
  LoadProgressDaoManager get managers => LoadProgressDaoManager(this);
}

class LoadProgressDaoManager {
  final _$LoadProgressDaoMixin _db;
  LoadProgressDaoManager(this._db);
  $$LoadProgressTableTableTableManager get loadProgressTable =>
      $$LoadProgressTableTableTableManager(
        _db.attachedDatabase,
        _db.loadProgressTable,
      );
}
