import 'package:stacked/stacked.dart';
import 'package:quotable/app/app.locator.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/quotes/quote_of_the_day_service.dart';

class QuoteOfTheDayViewModel extends ReactiveViewModel {
  final _quoteOfTheDayService = locator<QuoteOfTheDayService>();

  Quote? get quote => _quoteOfTheDayService.quote;
  bool get isFavorite => _quoteOfTheDayService.isFavorite;

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
    await _quoteOfTheDayService.refresh();
  }
}
