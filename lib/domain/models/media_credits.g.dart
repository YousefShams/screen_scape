// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaCredits _$MediaCreditsFromJson(Map<String, dynamic> json) => MediaCredits(
      (json['cast'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaCreditsToJson(MediaCredits instance) =>
    <String, dynamic>{
      'cast': instance.cast,
      'crew': instance.crew,
    };
