import 'package:quotable/app/app.locator.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/api_service.dart';
import 'package:quotable/services/quotes/quote_service.dart';
import 'package:stacked/stacked.dart';

class QuoteOfTheDayService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();
  final _quoteService = locator<QuoteService>();

  QuoteOfTheDay? _quote;

  QuoteOfTheDay? get quote => _quote;

  QuoteOfTheDayService() {
    listenToReactiveValues([_quote]);
  }

  Future<void> fetchQuote() async {
    final q = await fetchFromDb();

    if (q == null) {
      await fetchFromApi();
      return;
    }

    _quote = q;

    notifyListeners();
  }

  Future<QuoteOfTheDay?> fetchFromDb() async {
    return await _quoteService.getQuoteOfTheDay();
  }

  Future<void> fetchFromApi() async {
    final newQuote = await _apiService.fetchRandomQuote();
    await _quoteService.saveQuoteOfTheDay(newQuote);
    _quote!.quote = newQuote;
    _quote!.isSaved = false;

    await Future.delayed(const Duration(seconds: 3));

    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    if (_quote == null) {
      return;
    }

    if (_quote!.isSaved) {
      _quote!.isSaved = false;
      await _quoteService.delete(_quote!.quote);
    } else {
      _quote!.isSaved = true;
      await _quoteService.save(_quote!.quote);
    }

    notifyListeners();
  }

  Future<void> refresh() async {
    await _quoteService.deleteQuoteOfTheDay();
    await fetchFromApi();
  }
}
