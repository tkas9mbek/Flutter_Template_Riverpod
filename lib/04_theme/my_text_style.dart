import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: avoid_classes_with_only_static_members
class MyTextStyle {
  static TextStyle raleway({
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) => GoogleFonts.raleway(
    textStyle: textStyle,
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  );
}
