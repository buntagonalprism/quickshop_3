import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/lists/application/list_provider.dart';
import '../../data/lists/application/lists_notifier.dart';
import '../../data/lists/models/list_summary.dart';
import '../../router.dart';
import '../../services/auth_service.dart';
import '../../widgets/http_request_confirmation_dialog.dart';

class ListAction {
  const ListAction({
    required this.name,
    required this.icon,
    required this.onTap,
  });
  final String name;
  final Icon icon;
  final VoidCallback onTap;
}

class ListDetailDrawer extends ConsumerStatefulWidget {
  const ListDetailDrawer({required this.listId, required this.actions, super.key});
  final String listId;
  final List<ListAction> actions;

  @override
  ConsumerState<ListDetailDrawer> createState() => _ListDetailDrawerState();
}

class _ListDetailDrawerState extends ConsumerState<ListDetailDrawer> {
  @override
  Widget build(BuildContext context) {
    final list = ref.watch(listProvider(widget.listId)).value;
    final user = ref.watch(userAuthProvider);
    final isOwner = list?.ownerId == user!.id;
    final isEditor = list?.editorIds.contains(user.id) ?? false;
    final listName = list?.name ?? 'List name';
    final itemCount = list?.itemCount ?? 0;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
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
            const Divider(
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Share list'),
              onTap: () {
                ref.read(routerProvider).push(Routes.shareList(widget.listId).path);
              },
            ),
            const Divider(
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ...widget.actions.map((action) {
              return ListTile(
                leading: action.icon,
                title: Text(action.name),
                onTap: action.onTap,
              );
            }),
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
                  ref.read(routerProvider).push(Routes.editList(widget.listId).path);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete list'),
                onTap: () => onDeleteList(list!),
              ),
            ],
            if (isEditor && !isOwner)
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Leave list'),
                onTap: () => onLeaveList(list!),
              ),
            if (kDebugMode)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text('List ID: ${list?.id}'),
              ),
          ],
        ),
      ),
    );
  }

  void onDeleteList(ListSummary list) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Delete list'),
          content: const Text(
            'Are you sure you want to delete this list? Any other users will also loose access, and the list cannot be recovered.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ref.read(listsProvider.notifier).deleteList(list);
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

  void onLeaveList(ListSummary list) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return HttpRequestConfirmationDialog(
          confirmationTitle: 'Leave list',
          confirmationMessage:
              'Are you sure you want to leave this list? You will no longer be able to view or edit this list.',
          confirmationAction: 'Leave',
          requestInProgressMessage: 'Leaving list...',
          onConfirm: () => ref.read(listsProvider.notifier).leaveList(list),
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
