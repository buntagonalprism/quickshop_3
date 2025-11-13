import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/shopping/autocomplete/shopping_category_autocomplete.dart';
import '../../../repositories/shopping/history/shopping_category_history_repo.dart';
import '../../../repositories/shopping/suggestions/shopping_category_suggestion_repo.dart';
import '../shopping_items_notifier.dart';

part 'shopping_category_autocomplete_use_case.g.dart';

@riverpod
ShoppingCategoryAutocompleteUseCase shoppingCategoryAutocompleteUseCase(Ref ref, String listId) {
  return ShoppingCategoryAutocompleteUseCase(ref, listId);
}

class ShoppingCategoryAutocompleteUseCase {
  final String listId;
  final Ref _ref;
  ShoppingCategorySuggestionRepo get _suggestionRepo => _ref.read(shoppingCategorySuggestionRepoProvider);
  ShoppingCategoryHistoryRepo get _historyRepo => _ref.read(shoppingCategoryHistoryRepoProvider);

  ShoppingCategoryAutocompleteUseCase(this._ref, this.listId);

  Future<List<ShoppingCategoryAutocomplete>> getAutocomplete(String filter) async {
    final query = filter.trim().toLowerCase();
    final startMatches = <ShoppingCategoryAutocomplete>[];
    final middleMatches = <ShoppingCategoryAutocomplete>[];

    final includedCategories = <String>{};

    addIfNotAlreadyIncluded(ShoppingCategoryAutocomplete item) {
      if (!includedCategories.contains(item.name.toLowerCase())) {
        includedCategories.add(item.name.toLowerCase());
        if (item.name.toLowerCase().startsWith(query)) {
          startMatches.add(item);
        } else {
          middleMatches.add(item);
        }
      }
    }

    // Add existing categories from the current shopping list as highest priority
    final listItemsAsync = _ref.read(shoppingItemsProvider(listId));
    if (listItemsAsync.hasValue) {
      final listItems = listItemsAsync.requireValue;
      for (var item in listItems) {
        for (var category in item.categories) {
          if (category.toLowerCase().startsWith(query) || category.toLowerCase().contains(query)) {
            addIfNotAlreadyIncluded(_listCategoryToAutocomplete(category, item.id));
          }
        }
      }
    }

    // Fetch history and suggestions in parallel
    final (history, suggestions) = await (
      _historyRepo.searchHistory(query),
      _suggestionRepo.searchSuggestions(query),
    ).wait;

    // Append categories from the user's history to the results
    for (var historyCategory in history) {
      final autocomplete = ShoppingCategoryAutocomplete(
        name: historyCategory.name,
        source: ShoppingCategoryAutocompleteSource.history,
        sourceId: historyCategory.id,
      );
      addIfNotAlreadyIncluded(autocomplete);
    }

    // Finally, append common suggestions
    for (var suggestion in suggestions) {
      final autocomplete = ShoppingCategoryAutocomplete(
        name: suggestion.name,
        source: ShoppingCategoryAutocompleteSource.suggested,
        sourceId: suggestion.id,
      );
      addIfNotAlreadyIncluded(autocomplete);
    }

    return [...startMatches, ...middleMatches];
  }

  ShoppingCategoryAutocomplete _listCategoryToAutocomplete(String categoryName, String itemId) {
    return ShoppingCategoryAutocomplete(
      name: categoryName,
      source: ShoppingCategoryAutocompleteSource.list,
      sourceId: itemId,
    );
  }
}
