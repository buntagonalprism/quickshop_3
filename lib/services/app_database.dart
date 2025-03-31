import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../data/category_suggestions.dart';
import 'tables/category_suggestion_table.dart';
import 'tables/item_suggestion_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ItemSuggestionsTable, CategorySuggestionsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(String dbFileName) : super(_openConnection(dbFileName));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(String dbFileName) {
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
    }, beforeOpen: (details) async {
      if (details.wasCreated) {
        await batch((batch) {
          final suggestions = <CategorySuggestionsTableCompanion>[];
          for (final category in categorySuggestions) {
            for (final token in category.split(' ')) {
              if (token == '&' || token == '-' || token.isEmpty) continue;
              suggestions.add(CategorySuggestionsTableCompanion.insert(
                token: token.toLowerCase(),
                name: category,
              ));
            }
          }

          batch.insertAll(categorySuggestionsTable, suggestions);
        });
      }
    });
  }

  Future<List<CategorySuggestionsRow>> getCategorySuggestions(String token) async {
    return await (select(categorySuggestionsTable)
          ..where((c) => c.token.like('${token.toLowerCase()}%')))
        .get();
  }
}
