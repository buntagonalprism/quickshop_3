import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repositories/list_repo.dart';
import '../../repositories/shopping_list_item_repo.dart';
import '../../repositories/user_repo.dart';
import '../../router.dart';
import '../../widgets/http_request_confirmation_dialog.dart';

class ListDetailDrawer extends ConsumerStatefulWidget {
  const ListDetailDrawer({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ListDetailDrawer> createState() => _ListDetailDrawerState();
}

class _ListDetailDrawerState extends ConsumerState<ListDetailDrawer> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(listProvider(widget.listId)).valueOrNull;
    final user = ref.watch(userRepoProvider);
    final isOwner = list?.ownerId == user!.id;
    final listName = list?.name ?? 'List name';
    final itemCount = list?.itemCount ?? 0;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('$itemCount item${itemCount == 1 ? '' : 's'}'),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Share list'),
            onTap: () {
              ref.read(routerProvider).push(Routes.shareList(widget.listId));
            },
          ),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          ListTile(
            leading: const Icon(Icons.check_box_outlined),
            title: const Text('Remove checked items'),
            onTap: onRemoveCheckedItems,
          ),
          const Divider(
            thickness: 1,
            indent: 16,
            endIndent: 16,
          ),
          if (isOwner) ...[
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Rename list'),
              onTap: () {
                ref.read(routerProvider).push(Routes.editList(widget.listId));
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete list'),
              onTap: onDeleteList,
            )
          ],
          if (!isOwner)
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Leave list'),
              onTap: onLeaveList,
            )
        ],
      ),
    );
  }

  void onRemoveCheckedItems() async {
    final deleteFuture =
        ref.read(shoppingListItemRepoProvider(widget.listId).notifier).deleteCompletedItems();
    Scaffold.of(context).closeEndDrawer();
    final deletedCount = await deleteFuture;
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Deleted $deletedCount items'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void onDeleteList() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete list'),
          content: const Text(
              'Are you sure you want to delete this list? Any other users will also loose access, and the list cannot be recovered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(listRepoProvider.notifier).deleteList(widget.listId);
                Navigator.of(dialogContext).pop();
                Scaffold.of(context).closeEndDrawer();
                ref.read(routerProvider).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('List deleted'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void onLeaveList() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return HttpRequestConfirmationDialog(
          confirmationTitle: 'Leave list',
          confirmationMessage:
              'Are you sure you want to leave this list? You will no longer be able to view or edit this list.',
          confirmationAction: 'Leave',
          requestInProgressMessage: 'Leaving list...',
          onConfirm: () => ref.read(listRepoProvider.notifier).leaveList(widget.listId),
          onSuccess: (_) {
            Navigator.of(dialogContext).pop();
            Scaffold.of(context).closeEndDrawer();
            ref.read(routerProvider).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('List left'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        );
      },
    );
  }
}
