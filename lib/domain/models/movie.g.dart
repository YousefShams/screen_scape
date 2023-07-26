// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['title'] as String,
      json['poster_path'] as String,
      json['overview'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
      (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList(),
      json['id'] as int,
      json['runtime'] as int?,
      json['release_date'] as String,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
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
      'release_date': instance.releaseDate,
      'runtime': instance.durationMins,
    };
