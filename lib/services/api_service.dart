import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotable/models/quote.model.dart';

class ApiService {
  final _client = http.Client();
  final _baseUrl = 'https://quotable.kurokeita.dev';

  Future<Quote> fetchRandomQuote() async {
    final endpoint = '$_baseUrl/api/quotes/random';

    final response = await _client.get(Uri.parse(endpoint));
    final body = jsonDecode(response.body) as Map<String, dynamic>;

    return Quote.fromJson(body['quote']);
  }

  Future<List<Quote>> fetchQuotes() async {
    const limit = 10;
    final endpoint = '$_baseUrl/api/quotes/random?limit=$limit';

    final response = await _client.get(Uri.parse(endpoint));
    final body = jsonDecode(response.body) as Map<String, dynamic>;

    return (body['quotes'] as List<dynamic>)
        .map((quote) => Quote.fromJson(quote))
        .toList();
  }
}
