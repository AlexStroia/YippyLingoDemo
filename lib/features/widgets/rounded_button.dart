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
      opacity: onTap == null ? .5 : 1,
      child: Material(
        borderRadius: BorderRadius.circular(32),
        color: style == YipppyButtonSize.filled ? colors.orange : colors.light,
        child: InkWell(
          borderRadius: BorderRadius.circular(32),
          onTap: onTap,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: style == YipppyButtonSize.filled
                  ? colors.orange
                  : colors.light
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 2
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: fonts.h3.copyWith(
                    color: style == YipppyButtonSize.filled
                        ? colors.light
                        : colors
                        .black), //fonts.h3.copyWith(color: colors.white),
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
