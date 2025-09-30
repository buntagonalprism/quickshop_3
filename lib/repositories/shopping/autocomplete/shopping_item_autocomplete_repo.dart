import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../../../models/shopping/shopping_item.dart';
import '../../../services/shopping_item_name_parser.dart';
import '../../delay_provider_dispose.dart';
import '../history/shopping_item_history_repo.dart';
import '../shopping_items_repo.dart';
import '../suggestions/shopping_item_suggestion_repo.dart';

part 'shopping_item_autocomplete_repo.g.dart';

@riverpod
ShoppingItemAutocompleteRepo shoppingItemAutocompleteRepo(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 15));
  return ShoppingItemAutocompleteRepo._(ref, listId);
}

class ShoppingItemAutocompleteRepo {
  final String listId;
  final Ref _ref;
  ShoppingItemNameParser get _parser => _ref.read(shoppingItemNameParserProvider);
  ShoppingItemSuggestionRepo get _suggestionRepo => _ref.read(shoppingItemSuggestionRepoProvider);
  ShoppingItemHistoryRepo get _historyRepo => _ref.read(shoppingItemHistoryRepoProvider);

  ShoppingItemAutocompleteRepo._(this._ref, this.listId);

  /// Returns a list of suggestions that match the given filter
  Future<List<ShoppingItemAutocomplete>> getAutocomplete(String filter) async {
    final parsedItem = _parser.parse(filter);
    final product = parsedItem.product.trim().toLowerCase();
    final startMatches = <ShoppingItemAutocomplete>[];
    final middleMatches = <ShoppingItemAutocomplete>[];

    // Add items from the current shopping list as highest priority
    final listItemsAsync = _ref.read(shoppingListItemsProvider(listId));
    if (listItemsAsync.hasValue) {
      final listItems = listItemsAsync.requireValue;
      for (var item in listItems) {
        if (item.product.toLowerCase().startsWith(product)) {
          startMatches.add(_listItemToAutcomplete(item));
        } else if (item.product.toLowerCase().contains(product)) {
          middleMatches.add(_listItemToAutcomplete(item));
        }
      }
    }

    // Then add items from the user's history
    final history = await _historyRepo.searchHistory(product);
    for (var item in history) {
      final autocomplete = ShoppingItemAutocomplete(
        product: item.name,
        categories: item.categories,
        quantity: parsedItem.quantity,
        source: ShoppingItemAutocompleteSource.history,
        sourceId: item.id,
      );
      if (item.name.toLowerCase().startsWith(product)) {
        startMatches.add(autocomplete);
      } else {
        middleMatches.add(autocomplete);
      }
    }

    // Finally, add common suggestions
    final suggestions = await _suggestionRepo.searchSuggestions(product);
    for (var suggestion in suggestions) {
      final autocomplete = ShoppingItemAutocomplete(
        product: suggestion.name,
        categories: suggestion.categories,
        quantity: parsedItem.quantity,
        source: ShoppingItemAutocompleteSource.suggested,
        sourceId: suggestion.id,
      );
      if (suggestion.name.toLowerCase().startsWith(product)) {
        startMatches.add(autocomplete);
      } else {
        middleMatches.add(autocomplete);
      }
    }

    return [...startMatches, ...middleMatches];
  }

  /// Returns a suggestion if one exists with an exact product name match for the given item
  Future<ShoppingItemAutocomplete?> getExactMatchSuggestionForItem(String item) async {
    final parsedItem = _parser.parse(item);
    final product = parsedItem.product.trim().toLowerCase();
    final autocompleteOptions = await getAutocomplete(product);
    for (var option in autocompleteOptions) {
      if (option.product.toLowerCase() == product) {
        return option;
      }
    }
    return null;
  }

  void removeSuggestion(ShoppingItemAutocomplete suggestion) async {
    // TODO
    throw UnimplementedError();
  }

  ShoppingItemAutocomplete _listItemToAutcomplete(ShoppingItem item) {
    return ShoppingItemAutocomplete(
      product: item.product,
      categories: item.categories,
      quantity: item.quantity,
      source: ShoppingItemAutocompleteSource.list,
      sourceId: item.id,
    );
  }
}
