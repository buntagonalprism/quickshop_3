import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../analytics/logger.dart';
import '../models/shopping_category_suggestion.dart';
import '../services/app_database.dart';
import '../services/app_database_provider.dart';

part 'shopping_category_suggestion_repo.g.dart';

@riverpod
ShoppingCategorySuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  final db = ref.read(appDatabaseProvider);
  final log = ref.read(loggerProvider);
  return ShoppingCategorySuggestionRepo(db: db, log: log);
}

class ShoppingCategorySuggestionRepo {
  final AppDatabase db;
  final Logger log;

  ShoppingCategorySuggestionRepo({required this.db, required this.log});

  Future<List<ShoppingCategorySuggestion>> getSuggestions(String filter) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters

    final categorySuggestions = await db.getCategorySuggestions(filter);
    log.captureSpan(start, 'Category suggestions query');
    return categorySuggestions
        .map((suggestion) => ShoppingCategorySuggestion(
              name: suggestion.name,
              source: ShoppingCategorySuggestionSource.suggested,
            ))
        .toList();
  }
}
