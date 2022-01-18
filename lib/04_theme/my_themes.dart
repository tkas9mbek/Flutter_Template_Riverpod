import 'package:flutter/material.dart';

import 'my_colors.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: MyColors.neonMagentaAccent,
    primaryVariant: MyColors.neonMagentaAccent,
    onPrimary: Colors.white,
    secondary: MyColors.apricotAccent,
    secondaryVariant: MyColors.apricotAccent,
    onSecondary: Colors.white,
    surface: MyColors.apricotNeonMagentaMix,
    onSurface: Colors.black,
    background: MyColors.apricot,
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: MyColors.navy,
    primaryVariant: MyColors.navy,
    onPrimary: Colors.white,
    secondary: MyColors.purpleLight,
    secondaryVariant: MyColors.purpleLight,
    onSecondary: Colors.white,
    surface: MyColors.navyDark,
    onSurface: Colors.white,
    background: MyColors.purpleLight,
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
    ),
  ),
);
