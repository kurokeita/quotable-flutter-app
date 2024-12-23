import 'package:quotable/app/app.locator.dart';
import 'package:quotable/app/app.router.dart';
import 'package:quotable/services/quotes/quote_of_the_day_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await locator<QuoteOfTheDayService>().fetchQuote();

    _navigationService.replaceWithQuoteOfTheDayView();
  }
}
