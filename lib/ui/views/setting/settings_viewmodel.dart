import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/services/preferences/preference_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final _prefService = locator<PreferenceService>();

  void setThemeMode(BuildContext context, AdaptiveThemeMode mode) {
    _prefService.setThemeMode(context, mode);

    notifyListeners();
  }

  AdaptiveThemeMode getThemeMode(BuildContext context) {
    return _prefService.getCurrentMode(context);
  }

  Future<void> resetApp() async {
    await _prefService.resetApp();
  }
}
