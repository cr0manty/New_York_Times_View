// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    url: json['url'] as String,
    title: json['title'] as String,
    abstract: json['abstract'] as String,
    createdDate: json['created_date'] as String,
    media: (json['multimedia'] as List)
        ?.map(
            (e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    publishedDate: json['published_date'] as String,
    section: json['section'] as String,
    updatedDate: json['updated_date'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'section': instance.section,
      'title': instance.title,
      'abstract': instance.abstract,
      'created_date': instance.createdDate,
      'updated_date': instance.updatedDate,
      'url': instance.url,
      'published_date': instance.publishedDate,
      'multimedia': instance.media,
    };
