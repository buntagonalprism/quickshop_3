import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/settings/application/tooltips_notifier.dart';
import '../data/settings/models/tooltip_type.dart';

class ToggleTooltip extends ConsumerWidget {
  const ToggleTooltip({super.key, required this.type, required this.message});
  final TooltipType type;
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    if (!ref.watch(tooltipsProvider(type))) {
      return const SizedBox();
    }
    return Row(
      children: [
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            message,
            style: themeData.textTheme.bodySmall?.copyWith(color: themeData.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.start,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close),
          visualDensity: VisualDensity.compact,
          onPressed: () => ref.read(tooltipsProvider(type).notifier).set(false),
        ),
      ],
    );
  }
}
