import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/models/quote.model.dart';
import 'package:stacked_app/services/quotes/quote_of_the_day_service.dart';

class QuoteOfTheDayViewModel extends ReactiveViewModel {
  final _quoteOfTheDayService = locator<QuoteOfTheDayService>();

  Quote? get quote => _quoteOfTheDayService.quote;
  bool get isFavorite => _quoteOfTheDayService.isFavorite;

  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_quoteOfTheDayService];

  Future<void> fetchQuote() async {
    setBusy(true);

    await _quoteOfTheDayService.fetchQuote();

    setBusy(false);
  }

  Future<void> toggleFavorite() async {
    await _quoteOfTheDayService.toggleFavorite();
  }
}
