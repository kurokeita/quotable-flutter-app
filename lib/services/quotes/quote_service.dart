import 'package:quotable/app/app.locator.dart';
import 'package:quotable/database/quote.repository.dart';
import 'package:quotable/models/author.model.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/api_service.dart';
import 'package:quotable/services/authors/author_service.dart';
import 'package:stacked/stacked.dart';

class QuoteService with ListenableServiceMixin {
  final _apiService = locator<ApiService>();
  final _repository = locator<QuoteRepository>();
  final _authorService = locator<AuthorService>();

  QuoteOfTheDay? _quoteOfTheDay;

  QuoteOfTheDay? get quoteOfTheDay => _quoteOfTheDay;

  QuoteService() {
    listenToReactiveValues([_quoteOfTheDay]);
  }

  Future<QuoteOfTheDay> fetchQuoteOfTheDay() async {
    _quoteOfTheDay = await _fetchQuoteOfTheDayFromDb();

    if (_quoteOfTheDay == null) {
      return await _fetchQuoteOfTheDayFromApi();
    }

    notifyListeners();

    return _quoteOfTheDay!;
  }

  Future<void> refreshQuoteOfTheDay() async {
    await deleteQuoteOfTheDay();
    await _fetchQuoteOfTheDayFromApi();
  }

  Future<void> saveQuoteOfTheDay(Quote q) async {
    await _repository.saveQuoteOfTheDay(q);
  }

  Future<void> deleteQuoteOfTheDay() async {
    await _repository.deleteQuoteOfTheDay();
  }

  Future<Quote> save(Quote quote) async {
    await _authorService.create(quote.author as Author);
    await _repository.insert(quote);

    return quote;
  }

  Future<bool> delete(Quote quote) async {
    return await _repository.delete(quote);
  }

  Future<List<Quote>> getAll() async {
    final quotes = await _repository.getAll();

    return await _appendDataForQuotes(quotes);
  }

  Future<void> toggleFavorite(Quote quote) async {
    final isSaved = await _repository.isSaved(quote);

    if (isSaved) {
      await delete(quote);
    } else {
      await save(quote);
    }

    if (_quoteOfTheDay?.quote.uuid == quote.uuid) {
      _quoteOfTheDay!.isSaved = !isSaved;
    }

    notifyListeners();
  }

  Future<QuoteOfTheDay?> _fetchQuoteOfTheDayFromDb() async {
    final quote = await _repository.getQuoteOfTheDay();

    if (quote == null) {
      return null;
    }

    final quoteSaved = await _repository.getById(quote.uuid);

    if (quoteSaved != null) {
      return QuoteOfTheDay(
          quote: await _appendDataForSingleQuote(quoteSaved), isSaved: true);
    }

    return QuoteOfTheDay(quote: quote, isSaved: false);
  }

  Future<QuoteOfTheDay> _fetchQuoteOfTheDayFromApi() async {
    final quote = await _apiService.fetchRandomQuote();

    await saveQuoteOfTheDay(quote);

    _quoteOfTheDay = QuoteOfTheDay(quote: quote, isSaved: false);

    notifyListeners();

    return _quoteOfTheDay!;
  }

  Future<Quote> _appendDataForSingleQuote(Quote quote) async {
    final author = await _authorService.getById(quote.authorId);

    if (author != null) {
      quote.author = author;
    }

    return quote;
  }

  Future<List<Quote>> _appendDataForQuotes(List<Quote> quotes) async {
    final authorIds = quotes.map((q) => q.authorId).toList();

    final authors = await _authorService.getByIds(authorIds);
    final quotesWithAuthors = quotes.map((q) {
      final author = authors.firstWhere((a) => a.uuid == q.authorId);
      q.author = author;
      return q;
    }).toList();

    return quotesWithAuthors;
  }
}
