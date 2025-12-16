import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../repositories/hidden_suggestions_repo.dart';
import '../repositories/shopping/suggestions/shopping_item_suggestion_repo.dart';
import '../repositories/user_profile_repo.dart';
import '../repositories/user_profile_transaction.dart';

part 'hidden_suggestions_use_case.g.dart';

@Riverpod(keepAlive: true)
HiddenSuggestionsUseCase hiddenSuggestionsUseCase(Ref ref) {
  return HiddenSuggestionsUseCase(ref);
}

class HiddenSuggestionsUseCase {
  final Ref _ref;
  HiddenSuggestionsUseCase(this._ref) {
    _ref.read(userProfileRepoProvider).getProfile().listen((profile) async {
      if (profile != null) {
        final hiddenSuggestionsVersion = profile.lastHiddenSuggestionsVersion;
        if (hiddenSuggestionsVersion > 0) {
          final hiddenSuggestions =
              await _ref.read(hiddenSuggestionsRepoProvider).getHiddenSuggestions(hiddenSuggestionsVersion);
          if (hiddenSuggestions != null) {
            _ref.read(shoppingItemSuggestionRepoProvider).onHiddenSuggestionsUpdated(hiddenSuggestions.items);
          }
        }
      }
    });
  }

  Future<void> hideItemSuggestion(ShoppingItemAutocomplete suggestion) async {
    assert(suggestion.source == ShoppingItemAutocompleteSource.suggested, 'Only suggestions can be hidden');

    // Hide the suggestion locally
    await _ref.read(shoppingItemSuggestionRepoProvider).hideSuggestion(suggestion.sourceId);

    final tx = _ref.read(userProfileTransactionProvider)();

    // Save the hidden suggestion to the user's profile to sync across devices
    _ref.read(userProfileRepoProvider).incrementHiddenSuggestionsVersion(tx);
    _ref.read(hiddenSuggestionsRepoProvider).hideItem(tx, suggestion.sourceId);
    await tx.commit();
  }
}
