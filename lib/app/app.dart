import 'package:quotable/database/author.repository.dart';
import 'package:quotable/database/quote.repository.dart';
import 'package:quotable/services/api_service.dart';
import 'package:quotable/services/authentication_service.dart';
import 'package:quotable/services/authors/author_service.dart';
import 'package:quotable/services/database_service.dart';
import 'package:quotable/services/preferences/preference_service.dart';
import 'package:quotable/services/quotes/quote_service.dart';
import 'package:quotable/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:quotable/ui/bottom_sheets/quotes_list/quotes_list_sheet.dart';
import 'package:quotable/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:quotable/ui/views/quote_of_the_day/quote_of_the_day_view.dart';
import 'package:quotable/ui/views/setting/settings_view.dart';
import 'package:quotable/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: StartupView),
    MaterialRoute(page: QuoteOfTheDayView),
    MaterialRoute(page: SettingsView),
// @stacked-route
  ],
  dependencies: [
    InitializableSingleton(classType: DatabaseService),
    InitializableSingleton(classType: PreferenceService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: QuoteRepository),
    LazySingleton(classType: AuthorRepository),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: QuoteService),
    LazySingleton(classType: AuthorService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: QuotesListSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
