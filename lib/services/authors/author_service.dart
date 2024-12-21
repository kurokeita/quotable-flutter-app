import 'package:quotable/app/app.locator.dart';
import 'package:quotable/database/author.repository.dart';
import 'package:quotable/models/author.model.dart';

class AuthorService {
  final _repository = locator<AuthorRepository>();

  Future<Author> create(Author author) async {
    return await _repository.insert(author);
  }

  Future<Author?> getById(String id) async {
    return await _repository.getById(id);
  }
}
