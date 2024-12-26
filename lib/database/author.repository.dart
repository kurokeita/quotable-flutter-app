import 'package:quotable/database/base.repository.dart';
import 'package:quotable/models/author.model.dart';
import 'package:sqflite/sqflite.dart';

class AuthorRepository extends BaseRepository<Author> {
  AuthorRepository() : super('authors');

  Future<List<Author>> getAuthors() async {
    final List<Map<String, Object?>> authorMaps = await db.query(table);

    return [
      for (final {
            'uuid': uuid as String,
            'name': name as String,
            'slug': slug as String,
            'description': description as String,
            'bio': bio as String,
            'link': link as String,
          } in authorMaps)
        Author(
          uuid: uuid,
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
    await db.insert(table, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);

    return model;
  }

  @override
  Future<Author?> getById(String id) async {
    final List<Map<String, Object?>> maps = await db.query(
      table,
      where: 'uuid = ?',
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
      where: 'uuid = ?',
      whereArgs: [model.uuid],
    );

    return model;
  }

  @override
  Future<bool> delete(Author model) async {
    final rowsDeleted = await db.delete(
      table,
      where: 'uuid = ?',
      whereArgs: [model.uuid],
    );

    return rowsDeleted != 0;
  }

  Future<List<Author>> getByIds(List<String> ids) async {
    final List<Map<String, Object?>> authorMaps = await db.query(table,
        where: 'uuid IN (${ids.map((id) => '?').join(',')})', whereArgs: ids);

    return [
      for (final {
            'uuid': uuid as String,
            'name': name as String,
            'slug': slug as String,
            'description': description as String,
            'bio': bio as String,
            'link': link as String,
          } in authorMaps)
        Author(
          uuid: uuid,
          name: name,
          slug: slug,
          description: description,
          bio: bio,
          link: link,
        ),
    ];
  }
}
