import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import '../analytics/logger.dart';
import '../models/shopping_category_suggestion.dart';
import '../services/sqlite_db.dart';

part 'shopping_category_suggestion_repo.g.dart';

@riverpod
ShoppingCategorySuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  final db = ref.read(sqfliteDbProvider);
  final log = ref.read(loggerProvider);
  return ShoppingCategorySuggestionRepo(db: db, log: log);
}

class ShoppingCategorySuggestionRepo {
  final Database db;
  final Logger log;

  ShoppingCategorySuggestionRepo({required this.db, required this.log});

  Future<List<ShoppingCategorySuggestion>> getSuggestions(String filter) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters
    final categorySuggestionRows = await db.rawQuery(
      'SELECT name FROM CategorySuggestions WHERE token LIKE ?',
      ['${filter.toLowerCase()}%'],
    );
    final categorySuggestions = categorySuggestionRows.map((row) => row['name'] as String).toList();
    log.captureSpan(start, 'Category suggestions query');
    return categorySuggestions
        .map((suggestion) => ShoppingCategorySuggestion(
              name: suggestion,
              source: ShoppingCategorySuggestionSource.suggested,
            ))
        .toList();
  }
}
