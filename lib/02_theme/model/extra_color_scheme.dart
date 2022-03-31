import 'package:flutter/material.dart';

@immutable
class ExtraColorScheme {
  const ExtraColorScheme({
    required this.starFilled,
    required this.starEmpty,
    required this.secondaryText,
    required this.failBackground,
    required this.fail,
    required this.warningBackground,
    required this.warning,
    required this.successBackground,
    required this.success,
    required this.toastPositive,
    required this.toastNegative,
  });

  final Color starFilled;
  final Color starEmpty;
  final Color secondaryText;
  final Color failBackground;
  final Color fail;
  final Color warningBackground;
  final Color warning;
  final Color successBackground;
  final Color success;
  final Color toastPositive;
  final Color toastNegative;
}
