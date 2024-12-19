// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Quote _$QuoteFromJson(Map<String, dynamic> json) => Quote(
      json['uuid'] as String,
      nestedReader(json, 'author/uuid') as String,
      json['content'] as String,
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteToJson(Quote instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'author/uuid': instance.authorId,
      'content': instance.content,
      'author': instance.author,
    };
