import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/shopping_item.dart';
import '../../../../repositories/shopping_item_repo.dart';
import '../../../../router.dart';
import 'shopping_item_edit_view_model.dart';
import 'shopping_item_view.dart';

class ShoppingItemEditPage extends ConsumerWidget {
  ShoppingItemEditPage({required this.listId, required this.itemId}) : super(key: Key(itemId));
  final String listId;
  final String itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editVm = ref.watch(shoppingItemEditViewModelProvider(listId, itemId));

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
          return ShoppingItemView(listId: listId, item: item);
        },
      ),
    );
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
    ref.read(shoppingListItemRepoProvider(listId).notifier).deleteItem(item);
    ref.read(routerProvider).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Deleted item ${item.displayName}'),
      duration: const Duration(milliseconds: 2400),
    ));
  }
}
