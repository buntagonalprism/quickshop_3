import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/category_history_table.dart';
import '../tables/token_table.dart';

part 'category_history_dao.g.dart';

@DriftAccessor(tables: [CategoryHistoryTable])
class CategoryHistoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryHistoryDaoMixin {
  CategoryHistoryDao(super.db);

  Future<void> insert(List<CategoryHistoryRow> rows) async {
    final categorysById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(categoryHistoryTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.categoryHistory, categorysById);
    });
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
