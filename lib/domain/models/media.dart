import 'package:json_annotation/json_annotation.dart';
import '../../app/constants/constants.dart';
import 'genre.dart';
part 'media.g.dart';


@JsonSerializable()
class Media {

  @JsonKey(name : "title")
  final String name;
  @JsonKey(name : "id")
  final int id;
  @JsonKey(name : "poster_path")
  final String? imgPath;
  @JsonKey(name : "overview")
  final String overview;
  @JsonKey(name : "vote_average")
  final double rating;
  @JsonKey(name : "vote_count")
  final int rateCount;
  @JsonKey(name : "genres")
  final List<Genre>? genres;
  @JsonKey(name : "genre_ids")
  final List<int>? genreIds;
  @JsonKey(name : "popularity")
  final double popularity;
  @JsonKey(name : "release_date")
  final String? releaseDate;

  /*
   0 => movie
   1 => tv-show
   */
  final int type;


  const Media(this.name, this.imgPath, this.overview, this.rating, this.rateCount,
      this.genres, this.id, this.genreIds, this.popularity, this.releaseDate, this.type);

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
  
  List<Genre> getGenres() {
    if(genreIds!=null) {
      if(genreIds!.isEmpty) {
        genreIds!.add(-1);
      }
    }
    if(genres!=null && genres!.isNotEmpty) {
      return genres!;
    } else {
      return genreIds!.map((id) => Genre(AppConstants.genres[id] ?? "Anime", id)).toList();
    }
  }



/*

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

*/

/*

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
      json['release_date'] as String,
      json['runtime'] as int?,
    );

*/



/*

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
      json['first_air_date'] as String,
      (json['episode_run_time'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      json['seasons'] as List<dynamic>?,
    );
*/
}