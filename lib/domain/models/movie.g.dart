// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String,
      json['poster_path'] as String?,
      json['overview'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
      (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList(),
      json['id'] as int,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['popularity'] as num).toDouble(),
      json['release_date'] as String?,
      json["type"] ?? (json['name']!=null ? 1 : 0),
      json['runtime'] as int?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.name,
      'id': instance.id,
      'poster_path': instance.imgPath,
      'overview': instance.overview,
      'vote_average': instance.rating,
      'vote_count': instance.rateCount,
      'genres': instance.genres,
      'genre_ids': instance.genreIds,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'type': instance.type,
      'runtime': instance.durationMins,
    };
