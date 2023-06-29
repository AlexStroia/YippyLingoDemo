import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({required this.child, this.color, super.key});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final colors = theme.colors;
    final color = this.color ?? colors.light;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
