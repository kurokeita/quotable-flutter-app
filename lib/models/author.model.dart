import 'package:json_annotation/json_annotation.dart';
import 'package:slugify/slugify.dart';

part 'author.model.g.dart';

@JsonSerializable()
class Author {
  late String uuid;
  late String name;
  late String slug;
  late String? description;
  late String? bio;
  late String? link;
  late DateTime? createdAt;

  Author({
    required this.uuid,
    required this.name,
    required this.slug,
    this.description,
    this.bio,
    this.link,
    this.createdAt,
  });

  Author.fromMap(Map<String, Object?> map) {
    uuid = map['uuid'] as String;
    name = map['name'] as String;
    slug = map['slug'] as String;
    description = map['description'] as String;
    bio = map['bio'] as String;
    link = map['link'] as String;
    createdAt = DateTime.parse(map['createdAt'] as String);
  }

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, Object?> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'slug': slug,
      'description': description,
      'bio': bio,
      'link': link,
    };
  }

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  @override
  String toString() {
    return 'Author(uuid: $uuid, name: $name, slug: $slug, description: $description, bio: $bio, link: $link)';
  }

  static String getSlug(String name) => slugify(name);
}
