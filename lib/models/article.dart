import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:ny_times/models/media.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  @JsonKey(name: 'uri')
  String uri;
  @JsonKey(name: 'section')
  String section;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'abstract')
  String abstract;
  @JsonKey(name: 'created_date')
  String createdDate;
  @JsonKey(name: 'updated_date')
  String updatedDate;
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'published_date')
  String publishedDate;
  @JsonKey(name: 'multimedia')
  List<Media> media;

  Article({
    this.url,
    this.title,
    this.abstract,
    this.createdDate,
    this.media,
    this.publishedDate,
    this.section,
    this.updatedDate,
  });

  factory Article.fromJson(Map<String, dynamic> data) =>
      _$ArticleFromJson(data);

  @override
  String toString() => json.encode(_$ArticleToJson(this));

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

  String get previewImage =>
      media != null && media.length > 0 ? media.last.url : null;

  String get publishedAt {
    DateTime date = DateFormat('y-MM-ddTHH:mm:ss').parse(publishedDate);
    return DateFormat('dd MMM y').format(date);
  }
}
