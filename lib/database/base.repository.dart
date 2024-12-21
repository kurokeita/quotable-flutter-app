import 'package:sqflite/sqflite.dart';
import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/services/database_service.dart';

abstract class BaseRepository<T> {
  final _db = locator<DatabaseService>().db;
  final String table;

  BaseRepository(this.table);

  Database get db => _db;

  Future<T> insert(T model);
  Future<T> update(T model);
  Future<bool> delete(T model);
  Future<T?> getById(String id);
}
