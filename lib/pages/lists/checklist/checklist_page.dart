import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/debug_settings_notifier.dart';
import '../../../models/checklist_entry.dart';
import '../../../models/list_summary.dart';
import '../../../repositories/checklist_entry_repo.dart';
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
                  )
                ]
              : [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    tooltip: 'Edit list',
                    onPressed: () => setState(() => isEditing = true),
                  ),
                  Builder(builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      tooltip: 'Show menu',
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    );
                  }),
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
          ),
        ));
  }

  void onUncheckAllItems() async {
    ref.read(checklistEntryRepoProvider(widget.listId).notifier).uncheckAll();
    Navigator.pop(context);
  }

  void onRemoveCheckedItems() async {
    ref.read(checklistEntryRepoProvider(widget.listId).notifier).removeCheckedItems();
    Navigator.pop(context);
  }
}

@visibleForTesting
class ChecklistContentsView extends StatelessWidget {
  const ChecklistContentsView({
    required this.list,
    required this.items,
    required this.isEditing,
    super.key,
  });
  final ListSummary list;
  final List<ChecklistEntry> items;
  final bool isEditing;

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
        return ChecklistPageEntryTile(entry: items[index], listId: list.id);
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
    super.key,
  });
  final String listId;
  final ChecklistEntry entry;

  @override
  Widget build(BuildContext context) {
    return entry.when(
      item: (item) => ChecklistItemTile(
        item: item,
        listId: listId,
      ),
      heading: (heading) => ChecklistHeadingTile(
        heading: heading,
      ),
    );
  }
}

class ChecklistItemTile extends ConsumerWidget {
  const ChecklistItemTile({
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
      onTap: () => toggleItemCompleted(ref),
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
    ref.read(checklistEntryRepoProvider(listId).notifier).toggleItem(item);
  }
}

class ChecklistHeadingTile extends StatelessWidget {
  const ChecklistHeadingTile({
    required this.heading,
    super.key,
  });
  final ChecklistHeading heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Text(heading.name, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
