import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/checklists/application/checklist_entry_notifier.dart';
import '../../../data/checklists/models/checklist_entry.dart';
import '../../../data/lists/models/list_summary.dart';
import '../../../data/settings/application/debug_settings_notifier.dart';
import '../../../widgets/center_scrollable_column.dart';
import '../list_detail_drawer.dart';
import 'checklist_editing_view.dart';
import 'checklist_view_model.dart';

class ChecklistPage extends ConsumerStatefulWidget {
  const ChecklistPage({required this.listId, super.key});
  final String listId;

  @override
  ConsumerState<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends ConsumerState<ChecklistPage> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checklistViewModelProvider(widget.listId));
    final listTitle = state.maybeWhen(
      success: (list, _) => list.name,
      orElse: () => '',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(listTitle),
        actions: isEditing
            ? [
                TextButton.icon(
                  icon: const Icon(Icons.done),
                  label: const Text('DONE'),
                  onPressed: () => setState(() => isEditing = false),
                ),
              ]
            : [
                IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Edit list',
                  onPressed: () => setState(() => isEditing = true),
                ),
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      tooltip: 'Show menu',
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    );
                  },
                ),
              ],
      ),
      endDrawer: ListDetailDrawer(
        listId: widget.listId,
        actions: [
          ListAction(
            name: 'Delete completed items',
            icon: const Icon(Icons.delete),
            onTap: () => onRemoveCheckedItems(),
          ),
          ListAction(
            name: 'Uncheck all items',
            icon: const Icon(Icons.check_box_outline_blank),
            onTap: () => onUncheckAllItems(),
          ),
          // Only show if debugging
          if (kDebugMode)
            ListAction(
              name: 'Debug: Show sort keys',
              icon: const Icon(Icons.sort),
              onTap: () => ref.read(debugSettingsProvider(DebugSetting.showSortKeys).notifier).toggle(),
            ),
        ],
      ),
      body: state.when(
        notFound: () => const Center(child: Text('List not found')),
        error: () => const Center(child: Text('Failed to load list')),
        loading: () => const Center(child: CircularProgressIndicator()),
        success: (list, items) => ChecklistContentsView(
          list: list,
          items: items,
          isEditing: isEditing,
          onLongPress: () => setState(() => isEditing = true),
        ),
      ),
    );
  }

  void onUncheckAllItems() async {
    ref.read(checklistEntryProvider(widget.listId).notifier).uncheckAll();
    Navigator.pop(context);
  }

  void onRemoveCheckedItems() async {
    ref.read(checklistEntryProvider(widget.listId).notifier).removeCheckedItems();
    Navigator.pop(context);
  }
}

@visibleForTesting
class ChecklistContentsView extends StatelessWidget {
  const ChecklistContentsView({
    required this.list,
    required this.items,
    required this.isEditing,
    this.onLongPress,
    super.key,
  });
  final ListSummary list;
  final List<ChecklistEntry> items;
  final bool isEditing;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return ChecklistEditingView(items: items, list: list);
    }
    if (items.isEmpty) {
      return const ChecklistEmptyView();
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ChecklistPageEntryTile(entry: items[index], listId: list.id, onLongPress: onLongPress);
      },
    );
  }
}

@visibleForTesting
class ChecklistEmptyView extends StatelessWidget {
  const ChecklistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: CenterScrollableColumn(
        children: [
          SvgPicture.asset('assets/images/list_empty_icon.svg', height: 150, width: 120),
          const SizedBox(height: 16),
          Text(
            'This checklist is empty. It look\'s like you\'re all done for now!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text.rich(
            const TextSpan(
              text: 'To add items and headings to this list, use the edit button ',
              children: [
                WidgetSpan(child: Icon(Icons.edit)),
                TextSpan(text: ' above'),
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

class ChecklistPageEntryTile extends StatelessWidget {
  const ChecklistPageEntryTile({
    required this.listId,
    required this.entry,
    this.onLongPress,
    super.key,
  });
  final String listId;
  final ChecklistEntry entry;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return entry.when(
      item: (item) => ChecklistItemTile(
        item: item,
        listId: listId,
        onLongPress: onLongPress,
      ),
      heading: (heading) => ChecklistHeadingTile(
        heading: heading,
        onLongPress: onLongPress,
      ),
    );
  }
}

class ChecklistItemTile extends ConsumerWidget {
  const ChecklistItemTile({
    required this.listId,
    required this.item,
    this.onLongPress,
    super.key,
  });
  final String listId;
  final ChecklistItem item;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: () => toggleItemCompleted(ref),
      onLongPress: onLongPress,
      title: Text(
        item.name,
        style: item.completed ? const TextStyle(decoration: TextDecoration.lineThrough) : null,
      ),
      trailing: Checkbox(
        value: item.completed,
        onChanged: (value) => toggleItemCompleted(ref),
      ),
    );
  }

  void toggleItemCompleted(WidgetRef ref) {
    ref.read(checklistEntryProvider(listId).notifier).toggleItem(item);
  }
}

class ChecklistHeadingTile extends StatelessWidget {
  const ChecklistHeadingTile({
    required this.heading,
    this.onLongPress,
    super.key,
  });
  final ChecklistHeading heading;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Text(heading.name, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
