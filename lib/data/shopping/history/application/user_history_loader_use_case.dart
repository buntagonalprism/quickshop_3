import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/shopping_category_history_repo.dart';
import '../repositories/shopping_item_history_repo.dart';
import '../../../user/repositories/user_profile_repo.dart';

part 'user_history_loader_use_case.g.dart';

@Riverpod(keepAlive: true)
UserHistoryLoaderUseCase userAutcompleteLoaderUseCase(Ref ref) {
  return UserHistoryLoaderUseCase(ref);
}

class UserHistoryLoaderUseCase {
  final Ref _ref;
  UserHistoryLoaderUseCase(this._ref) {
    _ref.listen(userProfileProvider, (_, profileAsync) {
      final lastHistoryUpdate = profileAsync.value?.lastHistoryUpdate;
      if (lastHistoryUpdate != null) {
        _ref.read(shoppingCategoryHistoryRepoProvider).onUserHistoryUpdated(lastHistoryUpdate);
        _ref.read(shoppingItemHistoryRepoProvider).onUserHistoryUpdated(lastHistoryUpdate);
      }
    }, fireImmediately: true);
  }
}
