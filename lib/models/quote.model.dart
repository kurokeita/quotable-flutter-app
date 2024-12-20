import 'package:json_annotation/json_annotation.dart';
import 'package:stacked_app/helpers/nested_json_key.dart';
import 'package:stacked_app/models/author.model.dart';

part 'quote.model.g.dart';

@JsonSerializable()
class Quote {
  late String uuid;
  @NestedJsonKey(name: 'author/uuid')
  late String authorId;
  late String content;
  late Author? author;

  Quote(
    this.uuid,
    this.authorId,
    this.content,
    this.author,
  );

  Quote.fromMap(Map<String, Object?> map) {
    uuid = map['uuid'] as String;
    authorId = map['authorId'] as String;
    content = map['content'] as String;
  }

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

  Map<String, Object?> toMap() {
    return {
      'uuid': uuid,
      'authorId': authorId,
      'content': content,
    };
  }

  Map<String, dynamic> toJson() => _$QuoteToJson(this);

  @override
  String toString() {
    return 'Quote(uuid: $uuid, authorId: $authorId, content: $content, author: ${author.toString()})';
  }
}

class QuoteOfTheDay {
  Quote quote;
  bool isSaved;

  QuoteOfTheDay(this.quote, this.isSaved);
}
