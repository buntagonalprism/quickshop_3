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

  Future<List<ItemSuggestionsRow>> query(String queryString) async {
    return db.queryByTokens<ItemSuggestionsRow, ItemSuggestionsTable>(
      table: itemSuggestionsTable,
      idColumn: itemSuggestionsTable.id,
      nameColumn: itemSuggestionsTable.nameLower,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.itemSuggestion,
      queryString: queryString,
    );
  }
}
