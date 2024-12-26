import 'package:quotable/app/app.locator.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/quotes/quote_service.dart';
import 'package:stacked/stacked.dart';

class QuoteOfTheDayViewModel extends ReactiveViewModel {
  final _quoteService = locator<QuoteService>();

  QuoteOfTheDay? get quote => _quoteService.quoteOfTheDay;

  @override
  List<ListenableServiceMixin> get listenableServices => [_quoteService];

  Future<void> fetchQuote() async {
    setBusyForObject(quote, true);
    await _quoteService.fetchQuoteOfTheDay();
    setBusyForObject(quote, false);
  }

  Future<void> toggleFavorite() async {
    await _quoteService.toggleFavorite(quote!.quote);
  }

  Future<void> refresh() async {
    setBusyForObject(quote, true);
    await _quoteService.refreshQuoteOfTheDay();
    setBusyForObject(quote, false);
  }
}
