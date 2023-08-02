// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'media_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMember _$MediaMemberFromJson(Map<String, dynamic> json) => MediaMember(
      json['id'] as int,
      json['name'] as String,
      json['profile_path'] as String?,
      (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$MediaMemberToJson(MediaMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.imagePath,
      'popularity': instance.popularity,
    };
