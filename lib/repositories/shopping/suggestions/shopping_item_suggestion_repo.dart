import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/logger.dart';
import '../../../models/shopping/suggestions/shopping_item_suggestion.dart';

part 'shopping_item_suggestion_repo.g.dart';

@riverpod
ShoppingItemSuggestionRepo shoppingCategorySuggestionRepo(Ref ref) {
  return ShoppingItemSuggestionRepo(ref);
}

class ShoppingItemSuggestionRepo {
  final Ref _ref;
  // AppDatabase get _db => _ref.read(appDatabaseProvider);
  Logger get _log => _ref.read(loggerProvider);

  ShoppingItemSuggestionRepo(this._ref) {
    // TODO: Fetch suggestions for user locale
  }

  Future<List<ShoppingItemSuggestion>> getSuggestions(String filter) async {
    final start = DateTime.now();
    // TODO: Implement case insensitive search that handles multi-word filters
    _log.captureSpan(start, '$ShoppingItemSuggestionRepo.$getSuggestions');
    return [];
  }
}
