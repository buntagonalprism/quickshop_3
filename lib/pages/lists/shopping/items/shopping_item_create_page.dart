import 'package:flutter/material.dart';

import 'shopping_item_view.dart';

class ShoppingItemCreatePage extends StatelessWidget {
  const ShoppingItemCreatePage({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
        actions: const [
          ShoppingItemTooltipAction(),
        ],
      ),
      body: ShoppingItemView(listId: listId),
    );
  }
}
