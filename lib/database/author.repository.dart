import 'package:sqflite/sqflite.dart';
import 'package:stacked_app/database/base.repository.dart';
import 'package:stacked_app/models/author.model.dart';

class AuthorRepository extends BaseRepository<Author> {
  AuthorRepository() : super('authors');

  Future<List<Author>> getAuthors() async {
    final List<Map<String, Object?>> authorMaps = await db.query(table);

    return [
      for (final {
            'id': id as int,
            'name': name as String,
            'slug': slug as String,
            'description': description as String,
            'bio': bio as String,
            'link': link as String,
          } in authorMaps)
        Author(
          id: id,
          name: name,
          slug: slug,
          description: description,
          bio: bio,
          link: link,
        ),
    ];
  }

  @override
  Future<Author> insert(Author model) async {
    final id = await db.insert(table, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    model.id = id;
    return model;
  }

  @override
  Future<Author?> getById(int id) async {
    final List<Map<String, Object?>> maps = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return Author.fromMap(maps.first);
    }

    return null;
  }

  Future<Author?> getAuthorBySlug(String slug) async {
    final List<Map<String, Object?>> maps = await db.query(
      table,
      where: 'slug = ?',
      whereArgs: [Author.getSlug(slug)],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return Author.fromMap(maps.first);
    }

    return null;
  }

  @override
  Future<Author> update(Author model) async {
    await db.update(
      table,
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );

    return model;
  }

  @override
  Future<bool> delete(Author model) async {
    final rowsDeleted = await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [model.id],
    );

    return rowsDeleted != 0;
  }
}
