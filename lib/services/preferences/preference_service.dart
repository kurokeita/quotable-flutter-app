import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

class PreferenceService implements InitializableDependency {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static AdaptiveThemeMode getCurrentMode(BuildContext context) {
    return AdaptiveTheme.of(context).mode;
  }

  static void toggleThemeMode(BuildContext context) {
    AdaptiveTheme.of(context).toggleThemeMode();
  }
}
