import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/autocomplete/shopping_category_autocomplete.dart';
import '../../../services/app_database.dart';
import '../../../services/app_database_provider.dart';

part 'shopping_category_autocomplete_repo.g.dart';

@riverpod
ShoppingCategoryAutocompleteRepo shoppingCategoryAutocompleteRepo(Ref ref) {
  return ShoppingCategoryAutocompleteRepo(ref);
}

class ShoppingCategoryAutocompleteRepo {
  final Ref _ref;
  AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);

  ShoppingCategoryAutocompleteRepo(this._ref);

  Future<List<ShoppingCategoryAutocomplete>> getAutocomplete(String filter) async {
    final start = DateTime.now();
    // TODO: Verify that the query is properly case-insensitive and handles multi-word filters

    final categorySuggestions = await _db.categorySuggestionDao.query(filter);
    _log.captureSpan(start, 'Category suggestions query');
    return categorySuggestions
        .mapIndexed((index, suggestion) => ShoppingCategoryAutocomplete(
              name: suggestion.name,
              source: ShoppingCategoryAutocompleteSource.suggested,
              sourceId: index.toString(),
            ))
        .toList();
  }
}
