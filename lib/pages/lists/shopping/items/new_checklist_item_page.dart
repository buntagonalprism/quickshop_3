import 'package:flutter/material.dart';

class NewChecklistItemPage extends StatelessWidget {
  const NewChecklistItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: const Center(
        child: Text('Create a new checklist item here'),
      ),
    );
  }
}
