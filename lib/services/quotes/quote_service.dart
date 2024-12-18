import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/database/quote.repository.dart';
import 'package:stacked_app/models/author.model.dart';
import 'package:stacked_app/models/quote.model.dart';
import 'package:stacked_app/services/api_service.dart';
import 'package:stacked_app/services/authors/author_service.dart';

class QuoteService {
  final _apiService = locator<ApiService>();
  final _repository = locator<QuoteRepository>();
  final _authorService = locator<AuthorService>();

  Future<QuoteOfTheDay?> getQuoteOfTheDay() async {
    final quote = await _repository.getQuoteOfTheDay();

    if (quote == null) {
      return null;
    }

    final quoteSaved = await _repository.getById(quote.id);

    if (quoteSaved != null) {
      return QuoteOfTheDay(await _appendData(quoteSaved), true);
    }

    return QuoteOfTheDay(quote, false);
  }

  Future<void> saveQuoteOfTheDay(Quote q) async {
    await _repository.saveQuoteOfTheDay(q);
  }

  Future<Quote> save(Quote quote) async {
    await _authorService.create(quote.author as Author);
    await _repository.insert(quote);

    return quote;
  }

  Future<bool> delete(Quote quote) async {
    return await _repository.delete(quote);
  }

  Future<Quote> _appendData(Quote quote) async {
    final author = await _authorService.getById(quote.authorId);

    if (author != null) {
      quote.author = author;
    }

    return quote;
  }
}
