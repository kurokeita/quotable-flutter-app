import 'package:quotable/app/app.locator.dart';
import 'package:quotable/database/quote.repository.dart';
import 'package:quotable/models/author.model.dart';
import 'package:quotable/models/quote.model.dart';
import 'package:quotable/services/authors/author_service.dart';

class QuoteService {
  final _repository = locator<QuoteRepository>();
  final _authorService = locator<AuthorService>();

  Future<QuoteOfTheDay?> getQuoteOfTheDay() async {
    final quote = await _repository.getQuoteOfTheDay();

    if (quote == null) {
      return null;
    }

    final quoteSaved = await _repository.getById(quote.uuid);

    if (quoteSaved != null) {
      return QuoteOfTheDay(quote: await _appendData(quoteSaved), isSaved: true);
    }

    return QuoteOfTheDay(quote: quote, isSaved: false);
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

  Future<Quote> _appendData(Quote quote) async {
    final author = await _authorService.getById(quote.authorId);

    if (author != null) {
      quote.author = author;
    }

    return quote;
  }
}
