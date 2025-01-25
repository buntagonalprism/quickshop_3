import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/checklist_entry.dart';
import '../../../repositories/checklist_entry_repo.dart';
import 'checklist_text_edit_dialog.dart';
import 'checklist_view_model.dart';

class ChecklistPageEntryTileEditing extends StatelessWidget {
  const ChecklistPageEntryTileEditing({
    required this.listId,
    required this.entry,
    super.key,
  });
  final String listId;
  final ChecklistPageEntry entry;

  @override
  Widget build(BuildContext context) {
    return entry.when(
      ungroupedItem: (item) => ChecklistItemTileEditing(
        item: item,
        listId: listId,
      ),
      header: (header) => ChecklistGroupTileEditing(
        group: header,
        listId: listId,
      ),
      groupedItem: (item, group, isLast) => ChecklistGroupedItemTileEditing(
        item: item,
        group: group,
        isLast: isLast,
        listId: listId,
      ),
    );
  }
}

class ChecklistItemTileEditing extends ConsumerWidget {
  const ChecklistItemTileEditing({
    required this.listId,
    required this.item,
    super.key,
  });
  final String listId;
  final ChecklistItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        item.name,
        style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: const Icon(Icons.drag_handle),
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => ChecklistTextEditDialog(
          dialogTitle: 'Edit',
          initialValue: item.name,
          onComplete: (value) {
            if (value != item.name) {
              ref.read(checklistEntryRepoProvider(listId).notifier).editItem(item, value);
            }
          },
        ),
      ),
    );
  }
}

class ChecklistGroupTileEditing extends ConsumerWidget {
  const ChecklistGroupTileEditing({
    required this.listId,
    required this.group,
    super.key,
  });
  final String listId;
  final ChecklistGroup group;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            left: const BorderSide(),
            right: const BorderSide(),
            top: const BorderSide(),
            bottom: group.items.isEmpty ? const BorderSide() : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(4),
            topRight: const Radius.circular(4),
            bottomLeft: group.items.isEmpty ? const Radius.circular(4) : Radius.zero,
            bottomRight: group.items.isEmpty ? const Radius.circular(4) : Radius.zero,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(group.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextEditDialog(
                  dialogTitle: 'Edit',
                  initialValue: group.name,
                  onComplete: (value) {
                    if (value != group.name) {
                      ref.read(checklistEntryRepoProvider(listId).notifier).editGroup(group, value);
                    }
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () => _addItemToGroup(context, ref),
              child: const Text('Add item to group'),
            ),
          ],
        ),
      ),
    );
  }

  void _addItemToGroup(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => ChecklistTextEditDialog(
        dialogTitle: 'Add item',
        fieldName: 'Item name',
        onComplete: (value) {
          ref
              .read(checklistEntryRepoProvider(listId).notifier)
              .addItemToGroup(group, value, ChecklistAddPosition.start);
        },
      ),
    );
  }
}

class ChecklistGroupedItemTileEditing extends ConsumerWidget {
  const ChecklistGroupedItemTileEditing({
    required this.listId,
    required this.item,
    required this.group,
    required this.isLast,
    super.key,
  });
  final String listId;
  final ChecklistItem item;
  final ChecklistGroup group;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(),
                right: BorderSide(),
              ),
            ),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              onTap: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextEditDialog(
                  dialogTitle: 'Edit',
                  initialValue: item.name,
                  onComplete: (value) {
                    if (value != item.name) {
                      ref.read(checklistEntryRepoProvider(listId).notifier).editItem(item, value);
                    }
                  },
                ),
              ),
              title: Text(
                item.name,
                style:
                    item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
              ),
              trailing: const Icon(Icons.drag_handle),
            ),
          ),
          if (isLast)
            DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                border: Border(
                  left: BorderSide(),
                  right: BorderSide(),
                  bottom: BorderSide(),
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: () => _addItemToGroup(context, ref),
                  child: const Text('Add item to group'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _addItemToGroup(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => ChecklistTextEditDialog(
        dialogTitle: 'Add item',
        fieldName: 'Item name',
        onComplete: (value) {
          ref
              .read(checklistEntryRepoProvider(listId).notifier)
              .addItemToGroup(group, value, ChecklistAddPosition.end);
        },
      ),
    );
  }
}
