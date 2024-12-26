// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      uuid: json['uuid'] as String,
      authorId: nestedReader(json, 'author/uuid') as String,
      content: json['content'] as String,
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'author/uuid': instance.authorId,
      'content': instance.content,
      'author': instance.author,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
