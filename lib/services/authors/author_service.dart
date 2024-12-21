import 'package:stacked_app/app/app.locator.dart';
import 'package:stacked_app/database/author.repository.dart';
import 'package:stacked_app/models/author.model.dart';

class AuthorService {
  final _repository = locator<AuthorRepository>();

  Future<Author> create(Author author) async {
    return await _repository.insert(author);
  }

  Future<Author?> getById(String id) async {
    return await _repository.getById(id);
  }
}
