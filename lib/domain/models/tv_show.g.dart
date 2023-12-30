// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShow _$TVShowFromJson(Map<String, dynamic> json) => TVShow(
      json['name'] as String,
      json['poster_path'] as String?,
      json['overview'] as String,
      (json['vote_average'] as num).toDouble(),
      json['vote_count'] as int,
      (json['genres'] as List<dynamic>?)?.map(Genre.fromJson).toList(),
      json['id'] as int,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      (json['popularity'] as num).toDouble(),
      json['first_air_date'] as String?,
      json["type"] ?? (json['name']!=null ? 1 : 0),
      (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      json['seasons'] as List<dynamic>?,
    );

Map<String, dynamic> _$TVShowToJson(TVShow instance) => <String, dynamic>{
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
      'episode_run_time': instance.runtimes,
      'seasons': instance.seasons,
    };
