// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
      return Media(
        (json['title'] ?? json['name']) as String,
        json['poster_path'] as String?,
        json['overview'] as String,
        (json['vote_average'] as num).toDouble(),
        json['vote_count'] as int,
        (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList(),
        json['id'] as int,
        (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
        (json['popularity'] as num).toDouble(),
        (json['first_air_date'] ?? json['release_date']) as String,
      );
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'title': instance.name,
      'id': instance.id,
      'poster_path': instance.imgPath,
      'overview': instance.overview,
      'vote_average': instance.rating,
      'vote_count': instance.rateCount,
      'genres': instance.genres,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'releaseDate': instance.releaseDate,
    };
