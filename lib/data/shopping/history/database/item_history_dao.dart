import 'package:drift/drift.dart';

import '../../../app_database.dart';
import '../../../common/database/token_table.dart';
import 'item_history_table.dart';

part 'item_history_dao.g.dart';

@DriftAccessor(tables: [ItemHistoryTable])
class ItemHistoryDao extends DatabaseAccessor<AppDatabase> with _$ItemHistoryDaoMixin {
  ItemHistoryDao(super.db);

  Future<ItemHistoryRow> getById(String id) async {
    return (select(itemHistoryTable)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<void> insert(List<ItemHistoryRow> rows) async {
    final itemsById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(itemHistoryTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.itemHistory, itemsById);
    });
  }

  Future<void> updateContent(String id, String newName, String newCategory) async {
    final companion = ItemHistoryTableCompanion(
      name: Value(newName),
      nameLower: Value(newName.toLowerCase()),
      category: Value(newCategory),
    );
    await batch((batch) {
      batch.update(itemHistoryTable, companion, where: (tbl) => tbl.id.equals(id));
      db.updateTokens(batch, TokenType.itemHistory, {id: newName.toLowerCase()});
    });
  }

  Future<void> deleteByIds(List<String> ids) async {
    // Batch the list into groups of 50 to avoid queries that are too large
    for (var i = 0; i < ids.length; i += 50) {
      final batchIds = ids.sublist(i, i + 50 > ids.length ? ids.length : i + 50);
      await batch((batch) {
        batch.deleteWhere(itemHistoryTable, (tbl) => tbl.id.isIn(batchIds));
        db.deleteTokens(batch, TokenType.itemHistory, batchIds);
      });
    }
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
