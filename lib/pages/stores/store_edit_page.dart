import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../router.dart';

class StoreEditPage extends ConsumerWidget {
  final String listId;
  final String storeId;
  const StoreEditPage({super.key, required this.listId, required this.storeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            tooltip: 'Locations',
            onPressed: () => ref.read(routerProvider).go(Routes.storeLocations(listId, storeId).path),
          ),
        ],
      ),
      body: const Center(child: Text('Edit store form placeholder')),
    );
  }
}
