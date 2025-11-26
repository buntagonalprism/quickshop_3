import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/shopping/history/shopping_category_history_repo.dart';
import '../repositories/shopping/history/shopping_item_history_repo.dart';
import '../repositories/shopping/suggestions/shopping_item_suggestion_repo.dart';
import '../repositories/user_profile_repo.dart';

part 'user_autocomplete_loader_use_case.g.dart';

@Riverpod(keepAlive: true)
UserAutocompleteLoaderUserCase userAutcompleteLoaderUseCase(Ref ref) {
  return UserAutocompleteLoaderUserCase(ref);
}

class UserAutocompleteLoaderUserCase {
  final Ref _ref;
  UserAutocompleteLoaderUserCase(this._ref) {
    _ref.read(userProfileRepoProvider).getProfile().listen((hist) {
      if (hist != null) {
        _ref.read(shoppingCategoryHistoryRepoProvider).onUserHistoryUpdated(hist.lastHistoryUpdate);
        _ref.read(shoppingItemHistoryRepoProvider).onUserHistoryUpdated(hist.lastHistoryUpdate);
        if (hist.hiddenSuggestions.items.isNotEmpty) {
          _ref.read(shoppingItemSuggestionRepoProvider).onHiddenSuggestionsUpdated(hist.hiddenSuggestions.items);
        }
      }
    });
  }
}
