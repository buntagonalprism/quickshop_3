import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/shopping/shopping_items_notifier.dart';
import '../../../../models/shopping/shopping_item.dart';
import '../../../../models/shopping/shopping_item_raw_data.dart';
import '../../../../router.dart';
import 'models/shopping_item_errors.dart';
import 'shopping_item_edit_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemEditPage extends ConsumerStatefulWidget {
  ShoppingItemEditPage({required this.listId, required this.itemId}) : super(key: Key(itemId));
  final String listId;
  final String itemId;

  @override
  ConsumerState<ShoppingItemEditPage> createState() => _ShoppingItemEditPageState();
}

class _ShoppingItemEditPageState extends ConsumerState<ShoppingItemEditPage> {
  ShoppingItemRawData? rawData;
  ShoppingItemErrors? errors;

  @override
  Widget build(BuildContext context) {
    final editVm = ref.watch(shoppingItemEditViewModelProvider(widget.listId, widget.itemId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Item'),
        actions: [
          const ShoppingItemTooltipAction(),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              editVm.maybeWhen(
                success: (item) => _showDeleteConfirmationDialog(context, ref, item),
                orElse: () {},
              );
            },
          ),
        ],
      ),
      body: editVm.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: () => const Center(child: Text('Error loading item')),
        notFound: () => const Center(child: Text('Item not found')),
        success: (item) {
          return Column(
            children: [
              Expanded(
                child: ShoppingItemView(
                  listId: widget.listId,
                  data: ShoppingItemViewEditData(item: item),
                  errors: errors,
                  onDataChanged: (updatedRawData) {
                    setState(() {
                      rawData = updatedRawData;
                      errors = ShoppingItemErrors.validate(updatedRawData);
                    });
                  },
                  onSubmitted: () => _saveUpdatedItem(item),
                ),
              ),
              Material(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                  child: Center(
                    child: TextButton.icon(
                      onPressed: () => _saveUpdatedItem(item),
                      icon: const Icon(Icons.check),
                      label: const Text('Done'),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _saveUpdatedItem(ShoppingItem originalItem) {
    // No data changed, nothing to save
    final data = rawData;
    if (data == null) {
      Navigator.of(context).pop();
      return;
    }

    // Validate
    errors = ShoppingItemErrors.validate(data);
    if (errors!.hasErrors) {
      setState(() {});
      return;
    }

    ref
        .read(shoppingItemsProvider(widget.listId).notifier)
        .updateItem(
          item: originalItem,
          newName: data.product,
          newQuantity: data.quantity,
          newCategory: data.category,
        );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Updated item to ${data.displayName}'),
        duration: const Duration(milliseconds: 2400),
      ),
    );
    Navigator.of(context).pop();
  }

  void _showDeleteConfirmationDialog(BuildContext context, WidgetRef ref, ShoppingItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete item?'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteItem(context, ref, item);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(BuildContext context, WidgetRef ref, ShoppingItem item) {
    ref.read(shoppingItemsProvider(widget.listId).notifier).deleteItem(item);
    ref.read(routerProvider).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted item ${item.displayName}'),
        duration: const Duration(milliseconds: 2400),
      ),
    );
  }
}
