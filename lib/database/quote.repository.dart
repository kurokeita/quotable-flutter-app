import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked_app/app/app.logger.dart';
import 'package:stacked_app/database/base.repository.dart';
import 'package:stacked_app/models/quote.model.dart';

class QuoteRepository extends BaseRepository<Quote> {
  final _logger = getLogger('QuoteOfTheDayService');
  QuoteRepository() : super('quotes');

  @override
  Future<Quote> insert(Quote model) async {
    final id = await db.insert(table, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    model.id = id;
    return model;
  }

  @override
  Future<Quote> update(Quote model) async {
    await db
        .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

    return model;
  }

  @override
  Future<bool> delete(Quote model) async {
    final rowsDeleted =
        await db.delete(table, where: 'id = ?', whereArgs: [model.id]);
    return rowsDeleted != 0;
  }

  @override
  Future<Quote?> getById(int id) async {
    final List<Map<String, Object?>> maps =
        await db.query(table, where: 'id = ?', whereArgs: [id], limit: 1);

    if (maps.isNotEmpty) {
      return Quote.fromMap(maps.first);
    }

    return null;
  }

  Future<Quote?> getQuoteOfTheDay() async {
    await getAll();
    final List<Map<String, Object?>> maps = await db.query('quote_of_the_day',
        where: 'createdAt = ?',
        whereArgs: [DateFormat.yMMMd().format(DateTime.now())],
        limit: 1);

    if (maps.isNotEmpty) {
      return Quote.fromJson(
          jsonDecode(maps.first['quote'] as String) as Map<String, dynamic>);
    }

    return null;
  }

  Future<void> saveQuoteOfTheDay(Quote quote) async {
    await db.insert('quote_of_the_day', {
      'quote': jsonEncode(quote.toJson()),
      'createdAt': DateFormat.yMMMd().format(DateTime.now()),
    });
  }

  Future<List<Quote>> getAll() async {
    final List<Map<String, Object?>> maps = await db.query(table);

    return List.generate(maps.length, (i) {
      return Quote.fromMap(maps[i]);
    });
  }
}
