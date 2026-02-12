import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/application/firestore_transaction.dart';
import '../../../user/repositories/user_profile_repo.dart';
import '../../autocomplete/models/shopping_category_autocomplete.dart';
import '../../autocomplete/models/shopping_item_autocomplete.dart';
import '../database/suggestion_type.dart';
import '../repositories/hidden_suggestions_repo.dart';

part 'hidden_suggestions_use_case.g.dart';

@Riverpod(keepAlive: true)
HiddenSuggestionsUseCase hiddenSuggestionsUseCase(Ref ref) {
  return HiddenSuggestionsUseCase(ref);
}

class HiddenSuggestionsUseCase {
  final Ref _ref;
  HiddenSuggestionsUseCase(this._ref) {
    _ref.listen(userProfileProvider, (_, profileAsync) async {
      final profile = profileAsync.value;
      if (profile != null) {
        final hiddenSuggestionsVersion = profile.hiddenSuggestionsVersion;
        final repo = _ref.read(hiddenSuggestionsRepoProvider);
        final processedVersion = await repo.getProcessedHiddenSuggestionsVersion();
        if (hiddenSuggestionsVersion != null && hiddenSuggestionsVersion > processedVersion) {
          await repo.fetchAndApplyHiddenSuggestions(hiddenSuggestionsVersion);
        }
      }
    }, fireImmediately: true);
  }

  Future<void> hideItemSuggestion(ShoppingItemAutocomplete suggestion) async {
    assert(suggestion.source == ShoppingItemAutocompleteSource.suggested, 'Only suggestions can be hidden');

    // Hide the suggestion locally
    await _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionLocally(SuggestionType.item, suggestion.sourceId);

    // Save the hidden suggestion to the user's profile to sync across devices
    final tx = _ref.read(firestoreTransactionProvider)();
    _ref.read(userProfileRepoProvider).incrementHiddenSuggestionsVersion(tx);
    _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionRemotely(tx, SuggestionType.item, suggestion.sourceId);
    await tx.commit();
  }

  Future<void> hideCategorySuggestion(ShoppingCategoryAutocomplete suggestion) async {
    // Hide the suggestion locally
    await _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionLocally(SuggestionType.category, suggestion.sourceId);

    // Save the hidden suggestion to the user's profile to sync across devices
    final tx = _ref.read(firestoreTransactionProvider)();
    _ref.read(userProfileRepoProvider).incrementHiddenSuggestionsVersion(tx);
    _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionRemotely(tx, SuggestionType.category, suggestion.sourceId);
    await tx.commit();
  }
}
