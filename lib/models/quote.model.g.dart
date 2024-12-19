// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      json['id'] as String,
      json['authorId'] as String,
      json['content'] as String,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'id': instance.id,
      'authorId': instance.authorId,
      'content': instance.content,
      'author': instance.author,
    };
