import 'package:json_annotation/json_annotation.dart';
import 'package:quotable/helpers/nested_json_key.dart';
import 'package:quotable/models/author.model.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'quote.model.g.dart';

@JsonSerializable()
class Quote {
  late String uuid;
  @NestedJsonKey(name: 'author/uuid')
  late String authorId;
  late String content;
  late Author? author;
  late DateTime? createdAt;

  Quote({
    required this.uuid,
    required this.authorId,
    required this.content,
    this.author,
    this.createdAt,
  });

  Quote.fromMap(Map<String, Object?> map) {
    uuid = map['uuid'] as String;
    authorId = map['authorId'] as String;
    content = map['content'] as String;
    createdAt = DateTime.parse(map['createdAt'] as String);
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

  QuoteOfTheDay({required this.quote, required this.isSaved});

  static QuoteOfTheDay placeholder() => QuoteOfTheDay(
        quote: Quote(
          uuid: BoneMock.chars(16),
          authorId: BoneMock.chars(16),
          content: BoneMock.chars(16),
          author: Author(
              uuid: BoneMock.chars(16),
              name: BoneMock.chars(16),
              slug: BoneMock.chars(16)),
        ),
        isSaved: false,
      );
}
