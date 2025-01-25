import 'package:flutter/material.dart';

class ChecklistTextEditDialog extends StatefulWidget {
  const ChecklistTextEditDialog({
    required this.dialogTitle,
    required this.onComplete,
    this.fieldName,
    this.initialValue,
    super.key,
  });
  final String dialogTitle;
  final String? fieldName;
  final String? initialValue;
  final Function(String) onComplete;

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
      title: Text(widget.dialogTitle),
      content: TextField(
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
          labelText: widget.fieldName,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => onSave(),
          child: const Text('Save'),
        ),
      ],
    );
  }

  void onSave() {
    final text = controller.text.trim();
    if (text.isEmpty) {
      setState(() => error = 'Please enter a value');
      return;
    }
    widget.onComplete(text);
    Navigator.pop(context);
  }
}
