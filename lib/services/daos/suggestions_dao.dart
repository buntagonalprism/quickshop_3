import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/category_suggestion_table.dart';
import '../tables/hidden_suggestions_table.dart';
import '../tables/item_suggestion_table.dart';
import '../tables/suggestion_type.dart';
import '../tables/token_table.dart';

part 'suggestions_dao.g.dart';

@DriftAccessor(tables: [HiddenSuggestionsTable, ItemSuggestionsTable, CategorySuggestionsTable])
class SuggestionsDao extends DatabaseAccessor<AppDatabase> with _$SuggestionsDaoMixin {
  SuggestionsDao(super.db);

  Future<void> replaceAllHiddenSuggestions(List<HiddenSuggestionsRow> rows) async {
    await batch((batch) {
      batch.deleteAll(hiddenSuggestionsTable);
      batch.insertAll(hiddenSuggestionsTable, rows, mode: InsertMode.insert);
      for (final type in SuggestionType.values) {
        _updateAllHiddenFlags(batch, type);
      }
    });
  }

  void _updateAllHiddenFlags(Batch batch, SuggestionType type) async {
    final hst = db.hiddenSuggestionsTable;
    final helper = _SuggestionsHelper(db, type);
    helper.setAllUnhidden(batch);
    batch.customStatement(
      """UPDATE ${helper.tableName} 
        SET ${helper.hiddenColumnName} = 1 
        WHERE EXISTS (
          SELECT 1 FROM ${hst.tableName} 
          WHERE ${hst.tableName}.${hst.id.name} = ${helper.tableName}.${helper.idColumnName} 
          AND ${hst.tableName}.${hst.type.name} = '${type.value}'
        )""",
    );
  }

  Future<void> insertItems(List<ItemSuggestionsRow> rows) async {
    final itemsById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(itemSuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      _updateAllHiddenFlags(batch, SuggestionType.item);
      db.updateTokens(batch, TokenType.itemSuggestion, itemsById);
    });
  }

  Future<void> insertCategories(List<CategorySuggestionsRow> rows) async {
    final categoriesById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(categorySuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      _updateAllHiddenFlags(batch, SuggestionType.category);
      db.updateTokens(batch, TokenType.categorySuggestion, categoriesById);
    });
  }

  Future<void> updateHiddenFlag(SuggestionType type, String id, bool hidden, String locale) async {
    final helper = _SuggestionsHelper(db, type);
    await batch((batch) {
      helper.setHidden(batch, id);
      if (hidden) {
        batch.insert(
          db.hiddenSuggestionsTable,
          HiddenSuggestionsRow(id: id, type: type.value, locale: locale),
          mode: InsertMode.insertOrReplace,
        );
      } else {
        batch.deleteWhere(
          db.hiddenSuggestionsTable,
          (tbl) => tbl.id.equals(id) & tbl.type.equals(type.value) & tbl.locale.equals(locale),
        );
      }
    });
  }

  Future<List<ItemSuggestionsRow>> queryItems(String queryString) async {
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

  Future<List<CategorySuggestionsRow>> queryCategories(String queryString) async {
    return db.queryByTokens<CategorySuggestionsRow, CategorySuggestionsTable>(
      table: categorySuggestionsTable,
      idColumn: categorySuggestionsTable.id,
      nameColumn: categorySuggestionsTable.nameLower,
      hiddenColumn: categorySuggestionsTable.hidden,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.categorySuggestion,
      queryString: queryString,
      orderByDescColumn: categorySuggestionsTable.popularity,
    );
  }
}

class _SuggestionsHelper {
  final AppDatabase db;
  final SuggestionType type;
  _SuggestionsHelper(this.db, this.type);

  String get tableName => switch (type) {
    SuggestionType.item => db.itemSuggestionsTable.tableName,
    SuggestionType.category => db.categorySuggestionsTable.tableName,
  };

  String get idColumnName => switch (type) {
    SuggestionType.item => db.itemSuggestionsTable.id.name,
    SuggestionType.category => db.categorySuggestionsTable.id.name,
  };

  String get hiddenColumnName => switch (type) {
    SuggestionType.item => db.itemSuggestionsTable.hidden.name,
    SuggestionType.category => db.categorySuggestionsTable.hidden.name,
  };

  void setAllUnhidden(Batch batch) {
    switch (type) {
      case SuggestionType.item:
        batch.update(db.itemSuggestionsTable, ItemSuggestionsTableCompanion(hidden: Value(false)));
      case SuggestionType.category:
        batch.update(db.categorySuggestionsTable, CategorySuggestionsTableCompanion(hidden: Value(false)));
    }
  }

  void setHidden(Batch batch, String id) {
    switch (type) {
      case SuggestionType.item:
        batch.update(
          db.itemSuggestionsTable,
          ItemSuggestionsTableCompanion(hidden: Value(true)),
          where: (tbl) => tbl.id.equals(id),
        );
      case SuggestionType.category:
        batch.update(
          db.categorySuggestionsTable,
          CategorySuggestionsTableCompanion(hidden: Value(true)),
          where: (tbl) => tbl.id.equals(id),
        );
    }
  }
}
