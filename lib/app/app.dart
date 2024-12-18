import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/database/author.repository.dart';
import 'package:stacked_app/database/quote.repository.dart';
import 'package:stacked_app/services/api_service.dart';
import 'package:stacked_app/services/authentication_service.dart';
import 'package:stacked_app/services/authors/author_service.dart';
import 'package:stacked_app/services/database_service.dart';
import 'package:stacked_app/services/quotes/quote_of_the_day_service.dart';
import 'package:stacked_app/services/quotes/quote_service.dart';
import 'package:stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_app/ui/views/home/home_view.dart';
import 'package:stacked_app/ui/views/quote_list/quote_list_view.dart';
import 'package:stacked_app/ui/views/quote_of_the_day/quote_of_the_day_view.dart';
import 'package:stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: QuoteListView),
    MaterialRoute(page: QuoteOfTheDayView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: DatabaseService),
    LazySingleton(classType: QuoteRepository),
    LazySingleton(classType: AuthorRepository),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: QuoteOfTheDayService),
    LazySingleton(classType: QuoteService),
    LazySingleton(classType: AuthorService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
