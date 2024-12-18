import 'package:stacked/stacked.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/app/app.logger.dart';
import 'package:stacked_app/models/quote.model.dart';
import 'package:stacked_app/services/api_service.dart';
import 'package:stacked_app/services/quotes/quote_service.dart';

class QuoteOfTheDayService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();
  final _quoteService = locator<QuoteService>();
  final _logger = getLogger('QuoteOfTheDayService');

  Quote? _quote;

  Quote? get quote => _quote;

  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  QuoteOfTheDayService() {
    listenToReactiveValues([_quote, _isFavorite]);
  }

  Future<void> fetchQuote() async {
    final q = await _quoteService.getQuoteOfTheDay();

    _logger.d(q);

    if (q == null) {
      final newQuote = await _apiService.fetchRandomQuote();
      await _quoteService.saveQuoteOfTheDay(newQuote);
      _isFavorite = false;
    } else {
      _quote = q.quote;
      _isFavorite = q.isSaved;
    }

    _logger.d(_isFavorite);

    notifyListeners();
  }

  Future<void> toggleFavorite() async {
    if (_quote == null) {
      return;
    }

    if (_isFavorite) {
      _isFavorite = false;
      await _quoteService.delete(_quote!);
    } else {
      _isFavorite = true;
      await _quoteService.save(_quote!);
    }

    notifyListeners();
  }
}
