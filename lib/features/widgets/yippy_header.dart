import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class YippyHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? highlight;

  const YippyHeader(
      {required this.title, required this.subtitle, this.highlight, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final fonts = theme.fonts;
    final colors = theme.colors;
    return Column(
      children: [
        Text(
          title,
          style: theme.fonts.h2.copyWith(color: colors.orange),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8,),
        if (highlight != null)
          Center(child:Text.rich(
             TextSpan(
              text: subtitle,
              style: fonts.h1.copyWith(color: colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: ' $highlight',
                  style: fonts.h1.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            textAlign: TextAlign.center,

          ),)
        else
          Text(
            subtitle,
            style: fonts.h3.copyWith(color: colors.black),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
