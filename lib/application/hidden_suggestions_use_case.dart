import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/shopping/autocomplete/shopping_item_autocomplete.dart';
import '../repositories/hidden_suggestions_repo.dart';
import '../repositories/shopping/suggestions/shopping_item_suggestion_repo.dart';
import '../repositories/user_profile_repo.dart';
import '../repositories/user_profile_transaction.dart';
import '../services/tables/hidden_suggestions_table.dart';

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
        final hiddenSuggestionsVersion = profile.hiddenSuggestionsVersion;
        final repo = _ref.read(hiddenSuggestionsRepoProvider);
        if (hiddenSuggestionsVersion > repo.processedHiddenSuggestionsVersion) {
          await repo.fetchHiddenSuggestions(hiddenSuggestionsVersion);
          _ref.read(shoppingItemSuggestionRepoProvider).onHiddenSuggestionsUpdated();
        }
      }
    });
  }

  Future<void> hideItemSuggestion(ShoppingItemAutocomplete suggestion) async {
    assert(suggestion.source == ShoppingItemAutocompleteSource.suggested, 'Only suggestions can be hidden');

    // Hide the suggestion locally
    await _ref.read(shoppingItemSuggestionRepoProvider).hideSuggestion(suggestion.sourceId);

    // Save the hidden suggestion to the user's profile to sync across devices
    final tx = _ref.read(userProfileTransactionProvider)();
    _ref.read(userProfileRepoProvider).incrementHiddenSuggestionsVersion(tx);
    _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionRemotely(tx, SuggestionType.item, suggestion.sourceId);
    await tx.commit();
  }
}
