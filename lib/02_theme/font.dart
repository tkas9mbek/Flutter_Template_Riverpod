import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: avoid_classes_with_only_static_members
class MyFont {
  static TextStyle style({
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) => GoogleFonts.inter(
    textStyle: textStyle,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: height,
  );

  static TextStyle contact(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return style(
      color: colorScheme.onBackground,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }
}
