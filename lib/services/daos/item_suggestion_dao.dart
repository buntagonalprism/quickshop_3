import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/item_suggestion_table.dart';
import '../tables/token_table.dart';

part 'item_suggestion_dao.g.dart';

@DriftAccessor(tables: [ItemSuggestionsTable])
class ItemSuggestionDao extends DatabaseAccessor<AppDatabase> with _$ItemSuggestionDaoMixin {
  ItemSuggestionDao(super.db);

  Future<void> insert(List<ItemSuggestionsRow> rows) async {
    final itemsById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(itemSuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.itemSuggestion, itemsById);
    });
  }

  Future<void> deleteByIds(List<String> ids) async {
    // Batch the list into groups of 50 to avoid queries that are too large
    for (var i = 0; i < ids.length; i += 50) {
      final batchIds = ids.sublist(i, i + 50 > ids.length ? ids.length : i + 50);
      await batch((batch) {
        batch.deleteWhere(itemSuggestionsTable, (tbl) => tbl.id.isIn(batchIds));
        db.deleteTokens(batch, TokenType.itemSuggestion, batchIds);
      });
    }
  }

  Future<void> deleteById(String id) async {
    await batch((batch) {
      batch.deleteWhere(itemSuggestionsTable, (tbl) => tbl.id.equals(id));
      db.deleteTokens(batch, TokenType.itemSuggestion, [id]);
    });
  }

  Future<List<ItemSuggestionsRow>> query(String queryString) async {
    return db.queryByTokens<ItemSuggestionsRow, ItemSuggestionsTable>(
      table: itemSuggestionsTable,
      idColumn: itemSuggestionsTable.id,
      nameColumn: itemSuggestionsTable.nameLower,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.itemSuggestion,
      queryString: queryString,
      orderByDescColumn: itemSuggestionsTable.popularity,
    );
  }
}
