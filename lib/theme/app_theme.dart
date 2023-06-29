import 'package:flutter/material.dart';
import 'package:yippy_lingo_demo/theme/app_colors.dart';
import 'package:yippy_lingo_demo/theme/app_fonts.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  AppFonts get fonts => AppFonts();

  AppColors get colors => AppColors();

  @override
  ThemeExtension<AppTheme> copyWith() {
    return AppTheme();
  }

  @override
  ThemeExtension<AppTheme> lerp(ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme();
  }
}
