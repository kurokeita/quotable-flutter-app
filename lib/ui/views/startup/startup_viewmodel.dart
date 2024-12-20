import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.router.dart';
import 'package:stacked_app/services/quotes/quote_of_the_day_service.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    await locator<QuoteOfTheDayService>().fetchQuote();

    await Future.delayed(const Duration(seconds: 1));

    _navigationService.replaceWithQuoteOfTheDayView();
  }
}
