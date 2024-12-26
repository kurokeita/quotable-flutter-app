import 'package:quotable/app/app.locator.dart';
import 'package:quotable/app/app.router.dart';
import 'package:quotable/services/quotes/quote_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await locator<QuoteService>().fetchQuoteOfTheDay();

    _navigationService.replaceWithQuoteOfTheDayView();
  }
}
