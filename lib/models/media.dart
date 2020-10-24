import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  @JsonKey(name: 'url')
  String url;
  @JsonKey(name: 'format')
  String format;
  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'caption')
  String caption;
  @JsonKey(name: 'subtype')
  String subtype;

  Media({
    this.url,
    this.type,
    this.format,
    this.caption,
    this.subtype,
  });

  factory Media.fromJson(Map<String, dynamic> data) => _$MediaFromJson(data);

  @override
  String toString() => json.encode(_$MediaToJson(this));

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
