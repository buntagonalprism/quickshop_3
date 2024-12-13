import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/crash_reporter.dart';
import '../../../models/shopping_item.dart';
import '../../../repositories/list_item_repo.dart';

part 'shopping_item_edit_view_model.freezed.dart';
part 'shopping_item_edit_view_model.g.dart';

@freezed
class ShoppingItemEditViewModel with _$ShoppingItemEditViewModel {
  const ShoppingItemEditViewModel._();

  const factory ShoppingItemEditViewModel.loading() = _Loading;
  const factory ShoppingItemEditViewModel.error() = _Error;
  const factory ShoppingItemEditViewModel.notFound() = _NotFound;
  const factory ShoppingItemEditViewModel.success({required ShoppingItem item}) = _Success;
}

@riverpod
ShoppingItemEditViewModel shoppingItemEditViewModel(Ref ref, String listId, String itemId) {
  final itemsValue = ref.watch(shoppingListItemRepoProvider(listId));
  if (itemsValue.isLoading) {
    return const ShoppingItemEditViewModel.loading();
  }
  if (itemsValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsValue);
    return const ShoppingItemEditViewModel.error();
  }
  final items = itemsValue.value!;
  final item = items.firstWhereOrNull((item) => item.path == 'lists/$listId/items/$itemId');
  if (item == null) {
    return const ShoppingItemEditViewModel.notFound();
  }
  return ShoppingItemEditViewModel.success(item: item);
}
