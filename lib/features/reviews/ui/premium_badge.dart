import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_theme.dart';

class PremiumBadge extends StatelessWidget {
  const PremiumBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final fonts = theme.fonts;
    return Container(
      width: 123,
      decoration: BoxDecoration(
        color: const Color(0xFF38C77D), // Background color
        borderRadius: BorderRadius.circular(8), // Border radius
      ),
      padding: const EdgeInsets.all(8), // Padding
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1), // White border
            ),
            padding: const EdgeInsets.all(4), // Padding for the check icon
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 16,
            ),
          ),
          const SizedBox(width: 8), // Space between the check icon and text
          Text(
            'Premium',
            style: fonts.p2.copyWith(color: Colors.white), // Text style
          ),
        ],
      ),
    );
  }
}
