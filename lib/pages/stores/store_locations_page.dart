import 'package:flutter/material.dart';

class StoreLocationsPage extends StatelessWidget {
  final String listId;
  final String storeId;
  const StoreLocationsPage({super.key, required this.listId, required this.storeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store locations'),
      ),
      body: const Center(child: Text('Store locations placeholder')),
    );
  }
}
