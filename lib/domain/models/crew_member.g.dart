// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewMember _$CrewMemberFromJson(Map<String, dynamic> json) => CrewMember(
      job: json['job'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      imagePath: json['profile_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$CrewMemberToJson(CrewMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.imagePath,
      'popularity': instance.popularity,
      'job': instance.job,
    };
