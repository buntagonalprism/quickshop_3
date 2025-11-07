import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/list_provider.dart';
import '../../application/lists_notifier.dart';
import '../../models/list_summary.dart';
import '../../router.dart';
import '../../widgets/button_progress_indicator.dart';

class EditListPage extends ConsumerWidget {
  const EditListPage({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId));
    const errorView = Center(child: Text('Failed to load list'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rename List'),
      ),
      body: list.when(
        data: (list) => list == null ? errorView : _EditListView(list: list),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => errorView,
      ),
    );
  }
}

class _EditListView extends ConsumerStatefulWidget {
  const _EditListView({required this.list});
  final ListSummary list;

  @override
  ConsumerState<_EditListView> createState() => __EditListViewState();
}

class __EditListViewState extends ConsumerState<_EditListView> {
  final TextEditingController _controller = TextEditingController();
  String? errorText;
  bool updating = false;

  @override
  void initState() {
    _controller.text = widget.list.name;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubmit() async {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      setState(() => errorText = 'Name cannot be empty');
      return;
    }
    setState(() {
      updating = true;
      errorText = null;
    });
    try {
      await ref.read(listsNotifierProvider.notifier).updateListName(widget.list, name);
      if (mounted) {
        ref.read(routerProvider).pop();
      }
    } catch (e) {
      setState(() {
        updating = false;
        errorText = 'Failed to update list name';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: 'List name',
              errorText: errorText,
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: updating ? null : onSubmit,
              child: updating ? const ButtonProgressIndicator() : const Text('Update'),
            ),
          ),
        ],
      ),
    );
  }
}
