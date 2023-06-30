import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final YipppyButtonSize? style;
  final VoidCallback? onTap;

  const RoundedButton({
    super.key,
    required this.title,
    this.style = YipppyButtonSize.filled,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final colors = theme.colors;
    final fonts = theme.fonts;

    return Opacity(
      opacity: onTap == null ? 0.5 : 1,
      child: Material(
        borderRadius: BorderRadius.circular(32),
        color: style == YipppyButtonSize.filled ? colors.orange : colors.light,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onTap,
          child: Container(
            height: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: style == YipppyButtonSize.filled ? colors.orange : colors.light,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: fonts.p1.copyWith(
                color: style == YipppyButtonSize.filled ? colors.light : colors.black,
              ),
            ),
          ),
        ),
      ),
    );

  }
}

enum YipppyButtonSize {
  filled,
  outlined,
}
