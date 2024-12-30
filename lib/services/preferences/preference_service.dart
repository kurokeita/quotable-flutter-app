import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quotable/app/app.bottomsheets.dart';
import 'package:quotable/app/app.dialogs.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/services/database_service.dart';
import 'package:quotable/ui/views/startup/startup_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

class PreferenceService implements InitializableDependency {
  late final SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  AdaptiveThemeMode getCurrentMode(BuildContext context) {
    return AdaptiveTheme.of(context).mode;
  }

  static void toggleThemeMode(BuildContext context) {
    AdaptiveTheme.of(context).toggleThemeMode();
  }

  void setThemeMode(BuildContext context, AdaptiveThemeMode mode) {
    AdaptiveTheme.of(context).setThemeMode(mode);
  }

  Future<void> resetApp() async {
    await _prefs.clear();

    final databaseService = locator<DatabaseService>();
    await databaseService.resetDatabase();
    await locator.reset();
    await setupLocator();
    setupDialogUi();
    setupBottomSheetUi();

    final navigator = locator<NavigationService>();
    navigator.clearStackAndShowView(StartupView());
  }
}
