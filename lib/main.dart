import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:quotable/app/app.bottomsheets.dart';
import 'package:quotable/app/app.dialogs.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/app/app.router.dart';
import 'package:quotable/ui/theme/theme.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MainApp(savedThemeMode: savedThemeMode));
}

class MainApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MainApp({super.key, required this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppTheme.light,
        dark: AppTheme.dark,
        initial: savedThemeMode ?? AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                StackedService.routeObserver,
              ],
              theme: theme,
              darkTheme: darkTheme,
            ));
  }
}
