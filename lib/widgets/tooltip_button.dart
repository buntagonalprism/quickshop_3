import 'package:flutter/material.dart';

class TooltipButton extends StatelessWidget {
  final String title;
  final String message;
  const TooltipButton({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showTooltip(context),
      icon: Icon(Icons.help_outline),
    );
  }

  void showTooltip(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
