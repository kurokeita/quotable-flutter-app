// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      uuid: json['uuid'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      bio: json['bio'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'bio': instance.bio,
      'link': instance.link,
    };
