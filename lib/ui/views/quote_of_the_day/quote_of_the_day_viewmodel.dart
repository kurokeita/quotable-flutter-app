import 'package:quotable/app/app.locator.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/quotes/quote_of_the_day_service.dart';
import 'package:stacked/stacked.dart';

class QuoteOfTheDayViewModel extends ReactiveViewModel {
  final _quoteOfTheDayService = locator<QuoteOfTheDayService>();

  QuoteOfTheDay? get quote => _quoteOfTheDayService.quote;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_quoteOfTheDayService];

  Future<void> fetchQuote() async {
    setBusyForObject(quote, true);
    await _quoteOfTheDayService.fetchQuote();
    setBusyForObject(quote, false);
  }

  Future<void> toggleFavorite() async {
    await _quoteOfTheDayService.toggleFavorite();
  }

  Future<void> refresh() async {
    setBusyForObject(quote, true);
    await _quoteOfTheDayService.refresh();
    setBusyForObject(quote, false);
  }
}
