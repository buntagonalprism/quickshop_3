import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/hidden_suggestions_table.dart';
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

  Future<void> updateHiddenFlag(String id, bool hidden, String locale) async {
    await batch((batch) {
      batch.update(
        itemSuggestionsTable,
        ItemSuggestionsTableCompanion(hidden: Value(hidden)),
        where: (tbl) => tbl.id.equals(id),
      );
      if (hidden) {
        batch.insert(
          db.hiddenSuggestionsTable,
          HiddenSuggestionsRow(id: id, type: SuggestionType.item.value, locale: locale),
          mode: InsertMode.insertOrReplace,
        );
      } else {
        batch.deleteWhere(
          db.hiddenSuggestionsTable,
          (tbl) => tbl.id.equals(id) & tbl.type.equals(SuggestionType.item.value) & tbl.locale.equals(locale),
        );
      }
    });
  }

  Future<void> updateAllHiddenFlags() async {
    final ist = itemSuggestionsTable;
    final hst = db.hiddenSuggestionsTable;
    await batch((batch) {
      batch.update(ist, ItemSuggestionsTableCompanion(hidden: Value(false)));
      batch.customStatement(
        """UPDATE ${ist.tableName} 
        SET ${ist.hidden.name} = 1 
        WHERE EXISTS (
          SELECT 1 FROM ${hst.tableName} 
          WHERE ${hst.tableName}.${hst.id.name} = ${ist.tableName}.${ist.id.name} 
          AND ${hst.tableName}.${hst.type.name} = '${SuggestionType.item.value}'
        )""",
      );
    });
  }

  Future<List<ItemSuggestionsRow>> query(String queryString) async {
    return db.queryByTokens<ItemSuggestionsRow, ItemSuggestionsTable>(
      table: itemSuggestionsTable,
      idColumn: itemSuggestionsTable.id,
      nameColumn: itemSuggestionsTable.nameLower,
      hiddenColumn: itemSuggestionsTable.hidden,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.itemSuggestion,
      queryString: queryString,
      orderByDescColumn: itemSuggestionsTable.popularity,
    );
  }
}
