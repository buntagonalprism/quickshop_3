import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../services/shopping_item_name_parser.dart';
import '../../../delay_provider_dispose.dart';
import '../../../firestore_transaction.dart';
import '../../../user/repositories/user_profile_repo.dart';
import '../../history/repositories/shopping_item_history_repo.dart';
import '../../items/application/shopping_items_notifier.dart';
import '../../items/models/shopping_item.dart';
import '../../suggestions/repositories/shopping_item_suggestion_repo.dart';
import '../models/shopping_item_autocomplete.dart';

part 'shopping_item_autocomplete_use_case.g.dart';

@riverpod
ShoppingItemAutocompleteUseCase shoppingItemAutocompleteUseCase(Ref ref, String listId) {
  ref.delayDispose(const Duration(minutes: 15));
  return ShoppingItemAutocompleteUseCase._(ref, listId);
}

class ShoppingItemAutocompleteUseCase {
  final String listId;
  final Ref _ref;
  ShoppingItemNameParser get _parser => _ref.read(shoppingItemNameParserProvider);
  ShoppingItemSuggestionRepo get _suggestionRepo => _ref.read(shoppingItemSuggestionRepoProvider);
  ShoppingItemHistoryRepo get _historyRepo => _ref.read(shoppingItemHistoryRepoProvider);
  UserProfileRepo get _userProfileRepo => _ref.read(userProfileRepoProvider);

  ShoppingItemAutocompleteUseCase._(this._ref, this.listId);

  /// Returns a list of suggestions that match the given filter
  Future<List<ShoppingItemAutocomplete>> getAutocomplete(String filter) async {
    final parsedItem = _parser.parse(filter);
    final product = parsedItem.product.trim().toLowerCase();
    final startMatches = <ShoppingItemAutocomplete>[];
    final middleMatches = <ShoppingItemAutocomplete>[];

    // Add items from the current shopping list as highest priority
    final listItemsAsync = _ref.read(shoppingItemsProvider(listId));
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

    // Next, fetch history and suggestions in parallel
    final (history, suggestions) = await (
      _historyRepo.searchHistory(product),
      _suggestionRepo.searchSuggestions(product),
    ).wait;

    // Append items from the user's history
    for (var item in history) {
      final autocomplete = ShoppingItemAutocomplete(
        product: item.name,
        category: item.category,
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

    // Finally, append common suggestions
    for (var suggestion in suggestions) {
      final autocomplete = ShoppingItemAutocomplete(
        product: suggestion.name,
        category: suggestion.category,
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

  Future<void> removeHistoryEntry(ShoppingItemAutocomplete historyEntry) async {
    assert(historyEntry.source == ShoppingItemAutocompleteSource.history, 'Only history entries can be removed');

    final tx = _ref.read(firestoreTransactionProvider)();
    final now = DateTime.now();
    _historyRepo.deleteHistoryEntry(tx, historyEntry.sourceId, now);
    _userProfileRepo.setLastHistoryUpdate(tx, now);
    await tx.commit();
  }

  ShoppingItemAutocomplete _listItemToAutcomplete(ShoppingItem item) {
    return ShoppingItemAutocomplete(
      product: item.product,
      category: item.category,
      quantity: item.quantity,
      source: ShoppingItemAutocompleteSource.list,
      sourceId: item.id,
    );
  }
}
