import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/checklists/application/checklist_entry_notifier.dart';
import '../../../data/settings/application/debug_settings_notifier.dart';
import '../../../data/checklists/models/checklist_entry.dart';
import '../../../data/lists/models/list_summary.dart';
import '../../../data/checklists/repositories/checklist_entry_repo.dart';
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
        ref
            .read(checklistEntryProvider(widget.list.id).notifier)
            .moveEntry(widget.items[oldIndex - 1], (newIndex - 1).clamp(0, widget.items.length - 1));
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
    final showSortKeys = ref.watch(debugSettingsProvider(DebugSetting.showSortKeys));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.close, size: 20, color: Colors.redAccent),
          onPressed: () => ref.read(checklistEntryProvider(listId).notifier).removeItem(item),
        ),
        Expanded(
          child: InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (ctx) => ChecklistTextEditDialog(
                dialogTitle: 'Edit',
                initialValue: item.name,
                onComplete: (value) {
                  if (value.trim() != item.name) {
                    ref.read(checklistEntryProvider(listId).notifier).editItem(item, value);
                  }
                },
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                showSortKeys ? '${item.name}: ${item.sortKey.primary}, ${item.sortKey.secondary}' : item.name,
                style: item.completed
                    ? const TextStyle(decoration: TextDecoration.lineThrough)
                    : Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        ChecklistAddAfterButton(listId: listId, entry: item.asEntry),
        ChecklistDragHandle(index: index),
      ],
    );
  }
}

class ChecklistDragHandle extends StatelessWidget {
  const ChecklistDragHandle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return ReorderableDragStartListener(
      index: index,
      child: const SizedBox(
        height: 48,
        width: 48,
        child: Center(
          child: Icon(Icons.drag_handle),
        ),
      ),
    );
  }
}

class ChecklistAddAfterButton extends ConsumerWidget {
  const ChecklistAddAfterButton({
    super.key,
    required this.listId,
    required this.entry,
  });

  final String listId;
  final ChecklistEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuAnchor(
      builder: (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: const Icon(Icons.add, color: Colors.green, size: 20),
          tooltip: 'Show menu',
        );
      },
      menuChildren: [
        MenuItemButton(
          onPressed: () => _addItemAfter(context, ref),
          child: const Text('Add item below'),
        ),
        MenuItemButton(
          child: const Text('Add heading below'),
          onPressed: () => _addHeadingAfter(context, ref),
        ),
      ],
    );
  }

  void _addItemAfter(BuildContext context, WidgetRef ref) {
    final repo = ref.read(checklistEntryProvider(listId).notifier);
    showDialog(
      context: context,
      builder: (ctx) => ChecklistTextEditDialog(
        dialogTitle: 'Add item',
        fieldName: 'Item name',
        canAddMore: true,
        onComplete: (value) {
          repo.addItemAfter(value, entry);
        },
      ),
    );
  }

  void _addHeadingAfter(BuildContext context, WidgetRef ref) {
    final repo = ref.read(checklistEntryProvider(listId).notifier);
    showDialog(
      context: context,
      builder: (ctx) => ChecklistTextEditDialog(
        dialogTitle: 'Add heading',
        fieldName: 'Heading name',
        canAddMore: true,
        onComplete: (value) {
          repo.addHeadingAfter(value, entry);
        },
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
    final showSortKeys = ref.watch(debugSettingsProvider(DebugSetting.showSortKeys));

    final repo = ref.read(checklistEntryProvider(listId).notifier);
    return Row(
      children: [
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.close, size: 20, color: Colors.redAccent),
          onPressed: () => repo.removeHeading(heading),
        ),
        Expanded(
          child: InkWell(
            onTap: () => showDialog(
              context: context,
              builder: (ctx) => ChecklistTextEditDialog(
                dialogTitle: 'Edit',
                initialValue: heading.name,
                onComplete: (value) {
                  if (value.trim() != heading.name) {
                    repo.editHeading(heading, value);
                  }
                },
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                showSortKeys
                    ? '${heading.name}: ${heading.sortKey.primary}, ${heading.sortKey.secondary}'
                    : heading.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
        ),
        ChecklistAddAfterButton(listId: listId, entry: heading.asEntry),
        ChecklistDragHandle(index: index),
      ],
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
    final repo = ref.watch(checklistEntryProvider(listId).notifier);
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
                  onComplete: (value) => repo.addHeading(value, addPosition),
                  canAddMore: true,
                ),
              ),
              label: const Text('Add heading'),
              icon: const Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: Text('H', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
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
                  onComplete: (value) => repo.addItem(value, addPosition),
                  canAddMore: true,
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
