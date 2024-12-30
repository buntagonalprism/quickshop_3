import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/list_summary.dart';
import '../../models/shopping_item.dart';
import '../../repositories/shopping_list_item_repo.dart';
import '../../router.dart';
import '../../widgets/center_scrollable_column.dart';
import 'list_detail_drawer.dart';
import 'list_detail_view_model.dart';

class ListDetailPage extends ConsumerWidget {
  const ListDetailPage({required this.listId, super.key});

  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listDetailViewModelProvider(listId));
    final listTitle = state.maybeWhen(
      shoppingList: (list, _) => list.name,
      checklist: (list, _) => list.name,
      orElse: () => 'Shopping list',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Show menu',
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          }),
        ],
      ),
      endDrawer: ListDetailDrawer(listId: listId),
      body: state.when(
        notFound: () => const Center(child: Text('List not found')),
        error: () => const Center(child: Text('Failed to load list')),
        loading: () => const Center(child: CircularProgressIndicator()),
        shoppingList: (list, items) => ShoppingListContentsView(list: list, items: items),
        checklist: (list, _) => ChecklistItemsView(list: list),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add item'),
        icon: const Icon(Icons.add),
        onPressed: () {
          state.maybeWhen(
            shoppingList: (list, _) =>
                ref.read(routerProvider).go(Routes.newShoppingListItem(list.id)),
            checklist: (list, _) => ref.read(routerProvider).go(Routes.newChecklistItem(list.id)),
            orElse: () {},
          );
        },
      ),
    );
  }
}

@visibleForTesting
class ShoppingListContentsView extends ConsumerWidget {
  const ShoppingListContentsView({required this.list, required this.items, super.key});
  final ListSummary list;
  final List<ShoppingListPageItem> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (items.isEmpty) {
      return const ShoppingListEmptyView();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index].when(
        item: (item) => ShoppingItemTile(list: list, item: item),
        category: (category) => ShoppingCategoryHeader(categoryName: category),
      ),
    );
  }
}

@visibleForTesting
class ShoppingCategoryHeader extends StatelessWidget {
  const ShoppingCategoryHeader({required this.categoryName, super.key});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      alignment: Alignment.center,
      color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
      child: Text(
        categoryName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

@visibleForTesting
class ShoppingItemTile extends ConsumerWidget {
  const ShoppingItemTile({required this.list, required this.item, super.key});
  final ListSummary list;
  final ShoppingItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () => ref.read(shoppingListItemRepoProvider(list.id).notifier).toggleItem(item),
      onLongPress: () => ref.read(routerProvider).go(Routes.editShoppingListItem(list.id, item.id)),
      title: Text(
        item.displayName,
        style: TextStyle(decoration: item.completed ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(shoppingListItemRepoProvider(list.id).notifier).toggleItem(item);
        },
      ),
    );
  }
}

@visibleForTesting
class ShoppingListEmptyView extends StatelessWidget {
  const ShoppingListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CenterScrollableColumn(
        children: [
          SvgPicture.asset('assets/images/list_empty_icon.svg', height: 150, width: 120),
          const SizedBox(height: 16),
          Text(
            'This shopping list is empty. If your cupboard is full, it\'s time to relax!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            const TextSpan(
              text: 'To add a new item use the ',
              children: [
                WidgetSpan(child: Icon(Icons.add)),
                TextSpan(text: ' button below'),
              ],
            ),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            const TextSpan(
              text: 'To share this list with others open the options menu ',
              children: [
                WidgetSpan(child: Icon(Icons.more_vert)),
                TextSpan(text: ' above'),
              ],
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ChecklistItemsView extends StatelessWidget {
  const ChecklistItemsView({required this.list, super.key});
  final ListSummary list;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
