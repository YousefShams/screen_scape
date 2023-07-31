// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      json['id'] as int,
      json['name'] as String,
      json['profile_path'] as String?,
      (json['popularity'] as num).toDouble(),
      json['known_for_department'] as String,
      json['biography'] as String,
      json['birthday'] as String,
      json['place_of_birth'] as String,
      MediaCredits.fromJson(json['combined_credits'] as Map<String, dynamic>),
      List<String>.from(List<Map<String,dynamic>>.from((json['images']["profiles"] ))
          .map((e) => e["file_path"]).toList() )
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.imagePath,
      'popularity': instance.popularity,
      'known_for_department': instance.department,
      'biography': instance.biography,
      'birthday': instance.birthday,
      'place_of_birth': instance.placeOfBirth,
      'combined_credits': instance.credits,
      "images" : instance.images
    };
