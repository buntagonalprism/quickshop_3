import 'package:flutter/material.dart';

class ChecklistTextEditDialog extends StatefulWidget {
  const ChecklistTextEditDialog({
    required this.dialogTitle,
    required this.onComplete,
    this.fieldName,
    this.initialValue,
    this.canAddMore = false,
    super.key,
  });
  final String dialogTitle;
  final String? fieldName;
  final String? initialValue;
  final Function(String) onComplete;
  final bool canAddMore;

  @override
  State<ChecklistTextEditDialog> createState() => _ChecklistTextEditDialogState();
}

class _ChecklistTextEditDialogState extends State<ChecklistTextEditDialog> {
  late final TextEditingController controller;
  String? error;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.initialValue);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Expanded(child: Text(widget.dialogTitle)),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.fieldName,
        ),
      ),
      actions: [
        if (widget.canAddMore)
          TextButton(
            onPressed: () => onAddMore(),
            child: const Text('Add more'),
          ),
        TextButton(
          onPressed: () => onSave(),
          child: const Text('Save'),
        ),
      ],
    );
  }

  void onAddMore() {
    if (validate()) {
      final text = controller.text.trim();
      widget.onComplete(text);
      controller.clear();
    }
  }

  void onSave() {
    if (validate()) {
      final text = controller.text.trim();
      widget.onComplete(text);
      Navigator.pop(context);
    }
  }

  bool validate() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() => error = 'Please enter a value');
      return false;
    }
    return true;
  }
}
