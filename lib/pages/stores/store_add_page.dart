import 'package:flutter/material.dart';

class StoreAddPage extends StatelessWidget {
  final String listId;
  const StoreAddPage({super.key, required this.listId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add store'),
      ),
      body: const Center(child: Text('Add store form placeholder')),
    );
  }
}
