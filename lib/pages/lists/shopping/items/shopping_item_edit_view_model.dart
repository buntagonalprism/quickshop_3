import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/crash_reporter.dart';
import '../../../../models/shopping/shopping_item.dart';
import '../../../../repositories/shopping/shopping_item_repo.dart';

part 'shopping_item_edit_view_model.freezed.dart';
part 'shopping_item_edit_view_model.g.dart';

@freezed
class ShoppingItemEditModel with _$ShoppingItemEditModel {
  const ShoppingItemEditModel._();

  const factory ShoppingItemEditModel.loading() = _Loading;
  const factory ShoppingItemEditModel.error() = _Error;
  const factory ShoppingItemEditModel.notFound() = _NotFound;
  const factory ShoppingItemEditModel.success({required ShoppingItem item}) = _Success;
}

@riverpod
ShoppingItemEditModel shoppingItemEditViewModel(Ref ref, String listId, String itemId) {
  final itemsValue = ref.watch(shoppingListItemRepoProvider(listId));
  if (itemsValue.isLoading) {
    return const ShoppingItemEditModel.loading();
  }
  if (itemsValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsValue);
    return const ShoppingItemEditModel.error();
  }
  final items = itemsValue.value!;
  final item = items.firstWhereOrNull((item) => item.path == 'lists/$listId/items/$itemId');
  if (item == null) {
    return const ShoppingItemEditModel.notFound();
  }
  return ShoppingItemEditModel.success(item: item);
}
