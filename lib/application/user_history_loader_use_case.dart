import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/shopping/history/shopping_category_history_repo.dart';
import '../repositories/shopping/history/shopping_item_history_repo.dart';
import '../repositories/user_history_repo.dart';

part 'user_history_loader_use_case.g.dart';

@Riverpod(keepAlive: true)
UserHistoryLoaderUseCase userHistoryLoaderUseCase(Ref ref) {
  return UserHistoryLoaderUseCase(ref);
}

class UserHistoryLoaderUseCase {
  final Ref _ref;
  UserHistoryLoaderUseCase(this._ref) {
    _ref.read(userHistoryRepoProvider).userHistory().listen((hist) {
      if (hist != null) {
        _ref.read(shoppingCategoryHistoryRepoProvider).onUserHistoryUpdated(hist.userId, hist.lastHistoryUpdate);
        _ref.read(shoppingItemHistoryRepoProvider).onUserHistoryUpdated(hist.userId, hist.lastHistoryUpdate);
      }
    });
  }
}
