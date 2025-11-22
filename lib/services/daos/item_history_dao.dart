import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/item_history_table.dart';
import '../tables/token_table.dart';

part 'item_history_dao.g.dart';

@DriftAccessor(tables: [ItemHistoryTable])
class ItemHistoryDao extends DatabaseAccessor<AppDatabase> with _$ItemHistoryDaoMixin {
  ItemHistoryDao(super.db);

  Future<void> insert(List<ItemHistoryRow> rows) async {
    final itemsById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(itemHistoryTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.itemHistory, itemsById);
    });
  }

  Future<void> deleteById(String id) async {
    await batch((batch) {
      batch.deleteWhere(itemHistoryTable, (tbl) => tbl.id.equals(id));
      db.deleteTokens(batch, TokenType.itemHistory, [id]);
    });
  }

  Future<List<ItemHistoryRow>> query(String queryString) async {
    return db.queryByTokens<ItemHistoryRow, ItemHistoryTable>(
      table: itemHistoryTable,
      idColumn: itemHistoryTable.id,
      nameColumn: itemHistoryTable.nameLower,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.itemHistory,
      queryString: queryString,
      orderByDescColumn: itemHistoryTable.usageCount,
    );
  }
}
