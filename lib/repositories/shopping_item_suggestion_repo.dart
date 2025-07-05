import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/item_suggestions.dart';
import '../models/shopping/shopping_item.dart';
import '../models/shopping/suggestions/shopping_item_suggestion.dart';
import '../services/shopping_item_name_parser.dart';
import 'delay_provider_dispose.dart';
import 'shopping_item_repo.dart';

part 'shopping_item_suggestion_repo.g.dart';

@riverpod
ShoppingItemSuggestionRepo shoppingItemSuggestionRepo(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 15));
  return ShoppingItemSuggestionRepo._(ref, listId);
}

class ShoppingItemSuggestionRepo {
  final String listId;
  final Ref _ref;

  ShoppingItemSuggestionRepo._(this._ref, this.listId);

  /// Returns a list of suggestions that match the given filter
  Future<List<ShoppingItemSuggestion>> getSuggestions(String filter) async {
    final parser = _ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(filter);
    final product = parsedItem.product.trim().toLowerCase();
    final startMatches = <ShoppingItemSuggestion>[];
    final middleMatches = <ShoppingItemSuggestion>[];

    // Add items from the shopping list
    final listItemsAsync = _ref.read(shoppingListItemRepoProvider(listId));
    if (listItemsAsync.hasValue) {
      final listItems = listItemsAsync.requireValue;
      for (var item in listItems) {
        if (item.product.toLowerCase().startsWith(product)) {
          startMatches.add(_listItemToSuggestion(item));
        } else if (item.product.toLowerCase().contains(product)) {
          middleMatches.add(_listItemToSuggestion(item));
        }
      }
    }

    // Simulate a database query for suggestion matches
    await Future.delayed(const Duration(milliseconds: 200));

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

  /// Returns a suggestion if one exists with an exact product name match for the given item
  Future<ShoppingItemSuggestion?> getExactMatchSuggestionForItem(String item) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final parser = _ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(item);
    final product = parsedItem.product.trim().toLowerCase();
    final suggestion = _itemSuggestionsDataLower[product];
    if (suggestion == null) {
      return null;
    }
    return Future.value(ShoppingItemSuggestion(
      product: parsedItem.product,
      categories: [suggestion],
      quantity: parsedItem.quantity,
      source: ShoppingItemSuggestionSource.suggested,
    ));
  }

  final _itemSuggestionsDataLower = itemSuggestionsData.map(
    (key, value) => MapEntry(key.toLowerCase(), value),
  );

  void removeSuggestion(ShoppingItemSuggestion suggestion) async {
    // Simulate a database delete
    await Future.delayed(const Duration(milliseconds: 200));
    itemSuggestionsData.remove(suggestion.product);
  }

  ShoppingItemSuggestion _listItemToSuggestion(ShoppingItem item) {
    return ShoppingItemSuggestion(
      product: item.product,
      categories: item.categories,
      quantity: item.quantity,
      source: ShoppingItemSuggestionSource.list,
      listItemId: item.id,
    );
  }
}
