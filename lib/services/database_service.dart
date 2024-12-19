import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stacked_app/app/app.logger.dart';

class DatabaseService {
  final _logger = getLogger('DB Service');
  late final Database? _db;

  Database get db => _db!;

  DatabaseService();

  Future<void> init() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'quotable.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE quotes(
          uuid TEXT PRIMARY KEY,
          authorId TEXT NOT NULL,
          content TEXT NOT NULL
        )
      ''');

        await db.execute('''
        CREATE TABLE authors(
          uuid TEXT PRIMARY KEY,
          name TEXT NOT NULL UNIQUE,
          slug TEXT NOT NULL UNIQUE,
          description TEXT,
          bio TEXT,
          link TEXT
        )
      ''');

        await db.execute('''
          CREATE TABLE quote_of_the_day(
            quote TEXT NOT NULL,
            createdAt TEXT NOT NULL
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
    await deleteDatabase(join(await getDatabasesPath(), 'quotable.db'));
    await init();
  }
}
