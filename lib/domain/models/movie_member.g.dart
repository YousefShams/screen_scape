// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'movie_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieMember _$MovieMemberFromJson(Map<String, dynamic> json) => MovieMember(
      json['id'] as int,
      json['name'] as String,
      json['profile_path'] as String?,
      (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieMemberToJson(MovieMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.imagePath,
      'popularity': instance.popularity,
    };
