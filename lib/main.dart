import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_app/app/app.bottomsheets.dart';
import 'package:stacked_app/app/app.dialogs.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/services/database_service.dart';
import 'package:stacked_app/services/preferences/app_theme_service.dart';
import 'package:stacked_app/services/preferences/preference_service.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await locator<DatabaseService>().init();
  await locator<PreferenceService>().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppThemeService().init(),
      builder: (ctx, _) => MaterialApp(
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [
          StackedService.routeObserver,
        ],
        theme: ctx.watch<AppThemeService>().isDarkTheme
            ? ThemeData.dark()
            : ThemeData.light(),
      ),
    );
  }
}
