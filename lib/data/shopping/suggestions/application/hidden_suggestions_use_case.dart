import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/logger.dart';
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
          _log.log('Updating hidden suggestions from version $processedVersion to $hiddenSuggestionsVersion');
          await repo.fetchAndApplyHiddenSuggestions(hiddenSuggestionsVersion);
        }
      }
    }, fireImmediately: true);
  }

  late final _log = _ref.read(loggerProvider('$HiddenSuggestionsUseCase'));

  Future<void> hideItemSuggestion(ShoppingItemAutocomplete suggestion) async {
    assert(suggestion.source == ShoppingItemAutocompleteSource.suggested, 'Only suggestions can be hidden');

    _log.log('Hiding item suggestion: ${suggestion.sourceId}');

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

    _log.log('Hiding category suggestion ${suggestion.sourceId}');

    // Save the hidden suggestion to the user's profile to sync across devices
    final tx = _ref.read(firestoreTransactionProvider)();
    _ref.read(userProfileRepoProvider).incrementHiddenSuggestionsVersion(tx);
    _ref.read(hiddenSuggestionsRepoProvider).hideSuggestionRemotely(tx, SuggestionType.category, suggestion.sourceId);
    await tx.commit();
  }
}
