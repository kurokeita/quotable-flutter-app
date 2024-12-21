import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static ThemeData getCurrentTheme(BuildContext context) {
    return AdaptiveTheme.of(context).brightness == Brightness.dark
        ? ThemeData.dark()
        : ThemeData.light();
  }

  static void toggleThemeMode(BuildContext context) {
    if (PreferenceService.getCurrentTheme(context).brightness ==
        Brightness.dark) {
      AdaptiveTheme.of(context).setLight();

      return;
    }

    AdaptiveTheme.of(context).setDark();
  }
}
