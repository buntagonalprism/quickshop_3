import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../analytics/crash_reporter.dart';
import '../../../../data/shopping/items/application/shopping_items_notifier.dart';
import '../../../../data/shopping/items/models/shopping_item.dart';

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
  final itemsValue = ref.watch(shoppingItemsProvider(listId));
  if (itemsValue.hasError) {
    ref.read(crashReporterProvider).reportAsyncError(itemsValue);
    return const ShoppingItemEditModel.error();
  }
  if (itemsValue.isLoading) {
    return const ShoppingItemEditModel.loading();
  }
  final items = itemsValue.value!;
  final item = items.firstWhereOrNull((item) => item.id == itemId);
  if (item == null) {
    return const ShoppingItemEditModel.notFound();
  }
  return ShoppingItemEditModel.success(item: item);
}
