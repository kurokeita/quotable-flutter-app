import 'package:flutter/material.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/services/preferences/preference_service.dart';

class AppThemeService extends ChangeNotifier {
  final _prefs = locator<PreferenceService>();
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  AppThemeService init() {
    _isDarkTheme = _prefs.darkMode;

    return this;
  }

  Future<void> toggleTheme() async {
    _isDarkTheme = !_isDarkTheme;
    await _prefs.toggleDarkMode();
    notifyListeners();
  }
}
