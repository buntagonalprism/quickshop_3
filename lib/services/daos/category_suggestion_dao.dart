import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/category_suggestion_table.dart';
import '../tables/token_table.dart';

part 'category_suggestion_dao.g.dart';

@DriftAccessor(tables: [CategorySuggestionsTable])
class CategorySuggestionDao extends DatabaseAccessor<AppDatabase>
    with _$CategorySuggestionDaoMixin {
  CategorySuggestionDao(super.db);

  Future<void> insert(List<CategorySuggestionsRow> rows) async {
    final categorysById = {for (var row in rows) row.id: row.nameLower};
    await batch((batch) {
      batch.insertAll(categorySuggestionsTable, rows, mode: InsertMode.insertOrReplace);
      db.updateTokens(batch, TokenType.categorySuggestion, categorysById);
    });
  }

  Future<List<CategorySuggestionsRow>> query(String queryString) async {
    return db.queryByTokens<CategorySuggestionsRow, CategorySuggestionsTable>(
      table: categorySuggestionsTable,
      idColumn: categorySuggestionsTable.id,
      nameColumn: categorySuggestionsTable.nameLower,
      nameGetter: (row) => row.nameLower,
      idGetter: (row) => row.id,
      type: TokenType.categorySuggestion,
      queryString: queryString,
    );
  }
}
