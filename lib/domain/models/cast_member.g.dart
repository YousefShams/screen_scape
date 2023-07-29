// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastMember _$CastMemberFromJson(Map<String, dynamic> json) => CastMember(
      character: json['character'] as String,
      id: json['id'] as int,
      name: json['name'] as String,
      imagePath: json['profile_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$CastMemberToJson(CastMember instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.imagePath,
      'popularity': instance.popularity,
      'character': instance.character,
    };
