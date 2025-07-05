import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/item_suggestions.dart';
import '../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../models/shopping/shopping_item.dart';
import '../../../services/shopping_item_name_parser.dart';
import '../../delay_provider_dispose.dart';
import '../shopping_item_repo.dart';

part 'shopping_item_autocomplete_repo.g.dart';

@riverpod
ShoppingItemAutocompleteRepo shoppingItemAutocompleteRepo(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 15));
  return ShoppingItemAutocompleteRepo._(ref, listId);
}

class ShoppingItemAutocompleteRepo {
  final String listId;
  final Ref _ref;

  ShoppingItemAutocompleteRepo._(this._ref, this.listId);

  /// Returns a list of suggestions that match the given filter
  Future<List<ShoppingItemAutocomplete>> getAutocomplete(String filter) async {
    final parser = _ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(filter);
    final product = parsedItem.product.trim().toLowerCase();
    final startMatches = <ShoppingItemAutocomplete>[];
    final middleMatches = <ShoppingItemAutocomplete>[];

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
      final suggestion = ShoppingItemAutocomplete(
        product: entry.key,
        categories: [entry.value],
        quantity: parsedItem.quantity,
        source: entry.key.hashCode % 2 == 0
            ? ShoppingItemAutocompleteSource.suggested
            : ShoppingItemAutocompleteSource.history,
        sourceId: '123',
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
  Future<ShoppingItemAutocomplete?> getExactMatchSuggestionForItem(String item) async {
    await Future.delayed(const Duration(milliseconds: 100));
    final parser = _ref.read(shoppingItemNameParserProvider);
    final parsedItem = parser.parse(item);
    final product = parsedItem.product.trim().toLowerCase();
    final suggestion = _itemSuggestionsDataLower[product];
    if (suggestion == null) {
      return null;
    }
    return Future.value(ShoppingItemAutocomplete(
      product: parsedItem.product,
      categories: [suggestion],
      quantity: parsedItem.quantity,
      source: ShoppingItemAutocompleteSource.suggested,
      sourceId: '123',
    ));
  }

  final _itemSuggestionsDataLower = itemSuggestionsData.map(
    (key, value) => MapEntry(key.toLowerCase(), value),
  );

  void removeSuggestion(ShoppingItemAutocomplete suggestion) async {
    // Simulate a database delete
    await Future.delayed(const Duration(milliseconds: 200));
    itemSuggestionsData.remove(suggestion.product);
  }

  ShoppingItemAutocomplete _listItemToSuggestion(ShoppingItem item) {
    return ShoppingItemAutocomplete(
      product: item.product,
      categories: item.categories,
      quantity: item.quantity,
      source: ShoppingItemAutocompleteSource.list,
      sourceId: item.id,
    );
  }
}
