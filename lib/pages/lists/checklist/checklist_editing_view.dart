import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/checklist_entry.dart';
import '../../../models/list_summary.dart';
import '../../../repositories/checklist_entry_repo.dart';
import 'checklist_text_edit_dialog.dart';

class ChecklistEditingView extends ConsumerStatefulWidget {
  const ChecklistEditingView({
    super.key,
    required this.items,
    required this.list,
  });

  final List<ChecklistEntry> items;
  final ListSummary list;

  @override
  ConsumerState<ChecklistEditingView> createState() => _ChecklistEditingViewState();
}

class _ChecklistEditingViewState extends ConsumerState<ChecklistEditingView> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      onReorder: (oldIndex, newIndex) {
        // A known issue with ReorderableListView is that the newIndex is one too large when an item
        // is moved down. See https://github.com/flutter/flutter/issues/24786
        // Unfortunately the fix will not be merged even though its very simple because it would
        // introduce a breaking change to everyone that had already implemented a workaround
        // See https://github.com/flutter/flutter/pull/93146
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        print('QSLog Reordering from $oldIndex to $newIndex');
        ref
            .read(checklistEntryRepoProvider(widget.list.id).notifier)
            .moveItem(widget.items[oldIndex - 1], (newIndex - 1).clamp(0, widget.items.length - 1));
      },
      itemCount: widget.items.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) {
          return ChecklistAddActions(
            key: ValueKey(index),
            listId: widget.list.id,
            addPosition: ChecklistAddPosition.start,
          );
        }
        if (index == widget.items.length + 1) {
          return ChecklistAddActions(
            key: ValueKey(index),
            listId: widget.list.id,
            addPosition: ChecklistAddPosition.end,
          );
        }
        final entry = widget.items[index - 1];
        return entry.when(
          item: (item) => ChecklistItemTileEditing(
            key: ValueKey(item.id),
            index: index,
            item: item,
            listId: widget.list.id,
          ),
          heading: (header) => ChecklistHeadingTileEditing(
            key: ValueKey(header.id),
            heading: header,
            listId: widget.list.id,
            index: index,
          ),
        );
      },
    );
  }
}

class ChecklistItemTileEditing extends ConsumerWidget {
  const ChecklistItemTileEditing({
    required this.listId,
    required this.item,
    required this.index,
    super.key,
  });
  final String listId;
  final int index;
  final ChecklistItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        '${item.name}: ${item.sortKey.primary}, ${item.sortKey.secondary}',
        style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: ReorderableDragStartListener(
        index: index,
        child: const Icon(Icons.drag_handle),
      ),
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

class ChecklistHeadingTileEditing extends ConsumerWidget {
  const ChecklistHeadingTileEditing({
    required this.listId,
    required this.heading,
    required this.index,
    super.key,
  });
  final String listId;
  final int index;
  final ChecklistHeading heading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(
        '${heading.name}: ${heading.sortKey.primary}, ${heading.sortKey.secondary}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: ReorderableDragStartListener(
        index: index,
        child: const Icon(Icons.drag_handle),
      ),
      onTap: () => showDialog(
        context: context,
        builder: (ctx) => ChecklistTextEditDialog(
          dialogTitle: 'Edit',
          initialValue: heading.name,
          onComplete: (value) {
            if (value != heading.name) {
              ref.read(checklistEntryRepoProvider(listId).notifier).editHeading(heading, value);
            }
          },
        ),
      ),
    );
  }
}

class ChecklistAddActions extends ConsumerWidget {
  const ChecklistAddActions({
    required this.addPosition,
    required this.listId,
    super.key,
  });
  final ChecklistAddPosition addPosition;
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextEditDialog(
                  dialogTitle: 'Add heading',
                  fieldName: 'Heading name',
                  onComplete: (value) => ref
                      .read(checklistEntryRepoProvider(listId).notifier)
                      .addHeading(value, addPosition),
                ),
              ),
              label: const Text('Add heading'),
              icon: const Icon(Icons.category),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => showDialog(
                context: context,
                builder: (ctx) => ChecklistTextEditDialog(
                  dialogTitle: 'Add item',
                  fieldName: 'Item name',
                  onComplete: (value) => ref
                      .read(checklistEntryRepoProvider(listId).notifier)
                      .addItem(value, addPosition),
                ),
              ),
              label: const Text('Add item'),
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
