import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/item_suggestions.dart';
import '../models/shopping_item_suggestion.dart';
import '../services/shopping_item_name_parser.dart';

part 'shopping_item_suggestion_repo.g.dart';

@riverpod
ShoppingItemSuggestionRepo shoppingItemSuggestionRepo(Ref ref, String listId) {
  return ShoppingItemSuggestionRepo._(ref, listId);
}

class ShoppingItemSuggestionRepo {
  final String listId;
  final Ref _ref;

  ShoppingItemSuggestionRepo._(this._ref, this.listId);

  Future<List<ShoppingItemSuggestion>> getSuggestions(String filter) async {
    // Simulate a database query
    await Future.delayed(const Duration(milliseconds: 200));
    final parser = _ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(filter);
    final product = parsedItem.product.toLowerCase();
    final startMatches = <ShoppingItemSuggestion>[];
    final middleMatches = <ShoppingItemSuggestion>[];
    for (var entry in itemSuggestionsData.entries) {
      final suggestion = ShoppingItemSuggestion(
        product: entry.key,
        categories: [entry.value],
        quantity: parsedItem.quantity,
        source: entry.key.hashCode % 2 == 0
            ? ShoppingItemSuggestionSource.suggested
            : ShoppingItemSuggestionSource.history,
      );
      if (entry.key.toLowerCase().startsWith(product)) {
        startMatches.add(suggestion);
      } else if (entry.key.toLowerCase().contains(product)) {
        middleMatches.add(suggestion);
      }
    }
    return [...startMatches, ...middleMatches];
  }
}
