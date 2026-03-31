import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';

class StoresListPage extends ConsumerWidget {
  final String listId;
  const StoresListPage({super.key, required this.listId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stores'),
      ),
      body: ListTile(
        title: const Text('Placeholder store'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => ref.read(routerProvider).go(Routes.storeEdit(listId, 'placeholder-store-id').path),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Add store'),
        icon: const Icon(Icons.add),
        onPressed: () => ref.read(routerProvider).go(Routes.storeAdd(listId).path),
      ),
    );
  }
}
