import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/category_history_table.dart';
import 'tables/category_suggestion_table.dart';
import 'tables/item_history_table.dart';
import 'tables/item_suggestion_table.dart';
import 'tables/load_progress_table.dart';
import 'tables/token_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  ItemSuggestionsTable,
  CategorySuggestionsTable,
  ItemHistoryTable,
  CategoryHistoryTable,
  TokenTable,
  LoadProgressTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(String dbFileName) : super(_openConnection(dbFileName));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(String dbFileName) {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    return driftDatabase(
      name: dbFileName,
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(onUpgrade: (m, from, to) async {
      // The dumb migration strategy: delete all tables and recreate them.
      for (final table in allTables) {
        await m.deleteTable(table.actualTableName);
        await m.createTable(table);
      }
    });
  }

  Future<List<CategorySuggestionsRow>> getCategorySuggestions(String token) async {
    // TODO: We need new query logic for the new structure
    return await (select(categorySuggestionsTable)
          ..where((c) => c.nameLower.like('${token.toLowerCase()}%')))
        .get();
  }

  Future<void> insertCategoryHistory(List<CategoryHistoryRow> rows) async {
    await batch((batch) {
      batch.deleteWhere(
        tokenTable,
        (c) =>
            c.stringId.isIn(rows.map((r) => r.id)) & c.type.equals(TokenType.categoryHistory.value),
      );
      batch.insertAll(categoryHistoryTable, rows, mode: InsertMode.insertOrReplace);
      batch.insertAll(
        tokenTable,
        [
          for (final row in rows)
            for (final token in row.nameLower.split(' '))
              if (token.isNotEmpty && token.length > 1)
                TokenRow(
                  type: TokenType.categoryHistory.value,
                  stringId: row.id,
                  token: token,
                ),
        ],
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<ItemHistoryRow>> getItemHistory(String queryString) async {
    return _queryByTokens<ItemHistoryRow, ItemHistoryTable>(
      table: itemHistoryTable,
      idColumn: itemHistoryTable.id,
      idGetter: (row) => row.id,
      type: TokenType.itemHistory,
      queryString: queryString,
    );
  }

  Future<List<ItemSuggestionsRow>> getItemSuggestions(String queryString) async {
    return _queryByTokens<ItemSuggestionsRow, ItemSuggestionsTable>(
      table: itemSuggestionsTable,
      idColumn: itemSuggestionsTable.id,
      idGetter: (row) => row.id,
      type: TokenType.itemSuggestion,
      queryString: queryString,
    );
  }

  Future<List<Row>> _queryByTokens<Row extends DataClass, Tbl extends Table>({
    required TableInfo<Tbl, Row> table,
    required GeneratedColumn<String> idColumn,
    required String Function(Row) idGetter,
    required TokenType type,
    required String queryString,
  }) async {
    final trimmedLowerQuery = queryString.trim().toLowerCase();
    final queryTokens = trimmedLowerQuery.replaceAll('%', '').split(' ').where((t) => t.isNotEmpty);
    if (queryTokens.isEmpty) {
      return [];
    }
    final query = select(table).join([
      innerJoin(
          tokenTable, tokenTable.stringId.equalsExp(idColumn) & tokenTable.type.equals(type.value)),
    ])
      ..where(queryTokens.map((token) => tokenTable.token.like('$token%')).reduce((a, b) => a | b));

    final joinResults = await query.get();
    final tokenMatchCounts = <String, int>{};
    final rowResults = <Row>[];
    for (final row in joinResults) {
      final item = row.readTable(table);
      final itemId = idGetter(item);
      if (!tokenMatchCounts.containsKey(itemId)) {
        tokenMatchCounts[itemId] = 0;
        rowResults.add(item);
      }
      tokenMatchCounts[itemId] = tokenMatchCounts[itemId]! + 1;
    }
    if (queryTokens.length > 1) {
      // Sort suggestions by the number of matching tokens, descending
      rowResults.sortBy<num>((i) => -tokenMatchCounts[idGetter(i)]!);
    }
    return rowResults;
  }

  Future<void> insertItemSuggestions(List<ItemSuggestionsRow> rows) async {
    await batch((batch) {
      batch.insertAll(itemSuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      _updateTokens(batch, TokenType.itemSuggestion, {for (var row in rows) row.id: row.nameLower});
    });
  }

  Future<void> insertCategorySuggestions(List<CategorySuggestionsRow> rows) async {
    await batch((batch) {
      batch.insertAll(categorySuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      _updateTokens(
          batch, TokenType.categorySuggestion, {for (var row in rows) row.id: row.nameLower});
    });
  }

  void _updateTokens(Batch batch, TokenType type, Map<String, String> itemNamesById) {
    final itemKeys = itemNamesById.keys.toSet();
    batch.deleteWhere(
      tokenTable,
      (c) => c.stringId.isIn(itemKeys) & c.type.equals(type.value),
    );
    batch.insertAll(
      tokenTable,
      [
        for (final entry in itemNamesById.entries)
          for (final token in entry.value.toLowerCase().split(' '))
            if (token.isNotEmpty && token.length > 1)
              TokenRow(
                type: type.value,
                stringId: entry.key,
                token: token,
              ),
      ],
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<void> insertItemHistory(List<ItemHistoryRow> rows) async {
    await batch((batch) {
      batch.deleteWhere(
        tokenTable,
        (c) => c.stringId.isIn(rows.map((r) => r.id)) & c.type.equals(TokenType.itemHistory.value),
      );
      batch.insertAll(itemHistoryTable, rows, mode: InsertMode.insertOrReplace);
      batch.insertAll(
        tokenTable,
        [
          for (final row in rows)
            for (final token in row.nameLower.split(' '))
              if (token.isNotEmpty && token.length > 1)
                TokenRow(
                  type: TokenType.itemHistory.value,
                  stringId: row.id,
                  token: token,
                ),
        ],
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> saveLoadProgress(LoadProgressType type, DateTime retrievedUntil) async {
    await into(loadProgressTable).insert(
      LoadProgressRow(type: type.value, retrievedUntil: retrievedUntil.millisecondsSinceEpoch),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<DateTime?> getLoadProgress(LoadProgressType type) async {
    final row = await (select(loadProgressTable)..where((t) => t.type.equals(type.value)))
        .getSingleOrNull();
    return row?.retrievedUntil != null
        ? DateTime.fromMillisecondsSinceEpoch(row!.retrievedUntil)
        : null;
  }

  Future<void> clearAllSuggestions() {
    final suggestionProgressTypes = [
      LoadProgressType.categorySuggestion.value,
      LoadProgressType.itemSuggestion.value,
    ];
    return batch((batch) {
      batch.deleteAll(categorySuggestionsTable);
      batch.deleteAll(itemSuggestionsTable);
      batch.deleteWhere(loadProgressTable, (t) => t.type.isIn(suggestionProgressTypes));
    });
  }
}
