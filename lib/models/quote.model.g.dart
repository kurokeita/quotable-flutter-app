// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      (json['id'] as num).toInt(),
      (json['authorId'] as num).toInt(),
      json['content'] as String,
      Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'content': instance.content,
      'author': instance.author,
    };
