import 'package:flutter/material.dart';

/// A widget that allows a list of children to scroll vertically, while centering them within the
/// viewport if they are smaller than the viewport. All children should have a fixed/non-expanded
/// height. Spacing between children should be handled by Padding or SizedBox widgets.
class CenterScrollableColumn extends StatelessWidget {
  const CenterScrollableColumn({required this.children, super.key});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
