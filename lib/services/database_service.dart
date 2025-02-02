import 'package:path/path.dart';
import 'package:quotable/app/app.logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked/stacked_annotations.dart';

class DatabaseService implements InitializableDependency {
  final _logger = getLogger('DB Service');
  late final Database? _db;

  Database get db => _db!;

  DatabaseService();

  @override
  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'quotable.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE quotes(
          uuid TEXT PRIMARY KEY,
          authorId TEXT NOT NULL,
          content TEXT NOT NULL,
          createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''');

        await db.execute('''
        CREATE TABLE authors(
          uuid TEXT PRIMARY KEY,
          name TEXT NOT NULL UNIQUE,
          slug TEXT NOT NULL UNIQUE,
          description TEXT,
          bio TEXT,
          link TEXT,
          createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
        )
      ''');

        await db.execute('''
          CREATE TABLE quote_of_the_day(
            quote TEXT NOT NULL,
            createdAt TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
          )
        ''');
      },
    );
  }

  Future<void> listTables() async {
    final tables = await _db!
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    _logger.d('Tables: $tables');
  }

  Future<void> resetDatabase() async {
    if (_db != null) {
      await _db!.close();
    }

    await deleteDatabase(join(await getDatabasesPath(), 'quotable.db'));
  }
}
