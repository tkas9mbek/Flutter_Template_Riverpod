import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../colors.dart';
import '../model/extra_color_scheme.dart';
import 'theme_mode_provider.dart';

final _lightExtraColorScheme = ExtraColorScheme(
  starFilled: MyColors.yellowDarker,
  starEmpty: MyColors.greyLight,
  secondaryText: MyColors.grey,
  failBackground: MyColors.redShadow,
  fail: MyColors.red,
  warningBackground: MyColors.orange,
  warning: MyColors.yellow,
  successBackground: MyColors.greenShadow,
  success: MyColors.green,
  toastPositive: MyColors.greenLight,
  toastNegative: MyColors.redShadow,
);

final extraColorSchemeProvider = Provider<ExtraColorScheme>((ref) {
  final mode = ref.read(themeModeProvider);

  return mode == ThemeMode.dark
      ? _lightExtraColorScheme
      : _lightExtraColorScheme;
});
