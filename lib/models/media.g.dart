// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media(
    url: json['url'] as String,
    type: json['type'] as String,
    format: json['format'] as String,
    caption: json['caption'] as String,
    subtype: json['subtype'] as String,
  );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'type': instance.type,
      'caption': instance.caption,
      'subtype': instance.subtype,
    };
