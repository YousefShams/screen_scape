// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaVideo _$MediaVideoFromJson(Map<String, dynamic> json) => MediaVideo(
      json['name'] as String,
      json['site'] as String,
      json['key'] as String,
      json['official'] as bool,
      json['size'] as int,
      json['type'] as String,
    );

Map<String, dynamic> _$MediaVideoToJson(MediaVideo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'site': instance.site,
      'key': instance.key,
      'official': instance.official,
      'size': instance.size,
      'type': instance.type,
    };
