import 'package:quotable/app/app.locator.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/quotes/quote_service.dart';
import 'package:stacked/stacked.dart';

class QuotesListSheetModel extends BaseViewModel {
  final _quoteService = locator<QuoteService>();

  List<Quote> _quotes = [];
  List<Quote> get quotes => _quotes;

  Future<void> fetchQuotes() async {
    _quotes = await _quoteService.getAll();
    notifyListeners();
  }

  Future<void> deleteQuote(Quote quote) async {
    await _quoteService.toggleFavorite(quote);
    await fetchQuotes();
  }
}
