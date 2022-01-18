import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../02_service/provider/shared_preferences_provider.dart';
import '../my_themes.dart';

enum ThemeName {
  light,
  dark,
}

final themeChangeProvider = ChangeNotifierProvider<ThemeChangeNotifier>((ref) {
  final _sharedPreferences = ref.watch(sharedPreferencesProvider);

  return ThemeChangeNotifier(sharedPreferences: _sharedPreferences);
});

class ThemeChangeNotifier extends ChangeNotifier {
  ThemeChangeNotifier({
    required SharedPreferences sharedPreferences,
  }) : super() {
    _sharedPreferences = sharedPreferences;

    loadFromStorage();
  }

  late SharedPreferences _sharedPreferences;
  late ThemeName themeName;
  late ThemeData themeData;

  void switchTheme() {
    switch (themeName) {
      case ThemeName.light:
        updateTheme(ThemeName.dark);
        break;
      case ThemeName.dark:
        updateTheme(ThemeName.light);
        break;
    }
  }

  void updateTheme(ThemeName theme) {
    themeName = theme;
    themeData = getThemeData(theme);

    notifyListeners();

    _sharedPreferences.setString('theme', theme.toString());
  }

  ThemeData getThemeData(ThemeName theme) {
    switch (theme) {
      case ThemeName.light:
        return lightTheme;
      case ThemeName.dark:
        return darkTheme;
    }
  }

  void loadFromStorage() {
    final themeString = _sharedPreferences.get('theme');

    themeName = themeString == null
        ? ThemeName.light
        : ThemeName.values.firstWhere((e) => e.toString() == themeString);
    themeData = getThemeData(themeName);
  }
}
