import 'package:flutter/material.dart';

class AppFonts {
  String get fontFamily => "ObjectiveMk1";

  TextStyle get h1 => getTextStyle(
      fontSize: 33,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      lineHeight: 1.2);

  TextStyle get h2 => getTextStyle(
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      lineHeight: 1.5);

  TextStyle get h3 => getTextStyle(
      fontSize: 20,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      lineHeight: 1.5);

  TextStyle get p1 => getTextStyle(
      fontSize: 16,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      lineHeight: 1.5);

  TextStyle get p2 => getTextStyle(
        fontSize: 14,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
      );

  TextStyle get p3 => getTextStyle(
      fontSize: 9,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w300,
      lineHeight: 1.56);

  TextStyle getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    String? fontFamily,
    Color? color,
    double? lineHeight,
  }) {
    return TextStyle(
      height: lineHeight,
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
