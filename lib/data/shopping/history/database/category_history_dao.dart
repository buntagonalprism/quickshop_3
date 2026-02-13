import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../common/database/token_table.dart';
import 'category_history_table.dart';

part 'category_history_dao.g.dart';

@DriftAccessor(tables: [CategoryHistoryTable])
class CategoryHistoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryHistoryDaoMixin {
  CategoryHistoryDao(super.db);

  Future<CategoryHistoryRow> getById(String id) async {
    return (select(categoryHistoryTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<void> insert(List<CategoryHistoryRow> rows) async {
    final categorysById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(categoryHistoryTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.categoryHistory, categorysById);
    });
  }

  Future<void> updateContent(String id, String newName) async {
    final companion = CategoryHistoryTableCompanion(
      name: Value(newName),
      nameLower: Value(newName.toLowerCase()),
    );
    await batch((batch) {
      batch.update(categoryHistoryTable, companion, where: (tbl) => tbl.id.equals(id));
      db.updateTokens(batch, TokenType.categoryHistory, {id: newName.toLowerCase()});
    });
  }

  Future<void> deleteById(String id) async {
    await batch((batch) {
      batch.deleteWhere(categoryHistoryTable, (tbl) => tbl.id.equals(id));
      db.deleteTokens(batch, TokenType.categoryHistory, [id]);
    });
  }

  Future<void> deleteByIds(List<String> ids) async {
    // Batch the list into groups of 50 to avoid queries that are too large
    for (var i = 0; i < ids.length; i += 50) {
      final batchIds = ids.sublist(i, i + 50 > ids.length ? ids.length : i + 50);
      await batch((batch) {
        batch.deleteWhere(categoryHistoryTable, (tbl) => tbl.id.isIn(batchIds));
        db.deleteTokens(batch, TokenType.categoryHistory, batchIds);
      });
    }
  }

  Future<List<CategoryHistoryRow>> query(String queryString) async {
    return db.queryByTokens<CategoryHistoryRow, CategoryHistoryTable>(
      table: categoryHistoryTable,
      idColumn: categoryHistoryTable.id,
      nameColumn: categoryHistoryTable.nameLower,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.categoryHistory,
      queryString: queryString,
    );
  }
}
