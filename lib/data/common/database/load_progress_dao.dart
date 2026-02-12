import 'package:drift/drift.dart';

import '../../app_database.dart';
import 'load_progress_table.dart';

part 'load_progress_dao.g.dart';

@DriftAccessor(tables: [LoadProgressTable])
class LoadProgressDao extends DatabaseAccessor<AppDatabase> with _$LoadProgressDaoMixin {
  LoadProgressDao(super.db);

  Future<void> save(LoadProgressType type, DateTime retrievedUntil) async {
    await into(loadProgressTable).insert(
      LoadProgressRow(type: type.value, retrievedUntil: retrievedUntil.millisecondsSinceEpoch),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<DateTime?> get(LoadProgressType type) async {
    final row = await (select(loadProgressTable)..where((t) => t.type.equals(type.value))).getSingleOrNull();
    return row?.retrievedUntil != null ? DateTime.fromMillisecondsSinceEpoch(row!.retrievedUntil) : null;
  }
}
