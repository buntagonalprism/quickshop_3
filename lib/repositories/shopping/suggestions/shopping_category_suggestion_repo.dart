import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/suggestions/shopping_category_suggestion.dart';

part 'shopping_category_suggestion_repo.g.dart';

@riverpod
ShoppingCategorySuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  return ShoppingCategorySuggestionRepo(ref);
}

class ShoppingCategorySuggestionRepo {
  final Ref _ref;
  // AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);

  ShoppingCategorySuggestionRepo(this._ref) {
    // TODO: Fetch suggestions for user locale
  }

  Future<List<ShoppingCategorySuggestion>> getSuggestions(String filter) async {
    final start = DateTime.now();
    // TODO: Implement case insensitive search that handles multi-word filters
    _log.captureSpan(start, '$ShoppingCategorySuggestionRepo.$getSuggestions');
    return [];
  }
}
