
import 'package:json_annotation/json_annotation.dart';
import '../../app/constants/constants.dart';
import 'genre.dart';
part 'movie.g.dart';


@JsonSerializable()
class Movie {

  @JsonKey(name : "title")
  final String name;
  @JsonKey(name : "id")
  final int id;
  @JsonKey(name : "poster_path")
  final String imgPath;
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
  @JsonKey(name : "release_date")
  final String releaseDate;
  @JsonKey(name : "runtime")
  final int? durationMins;

  const Movie(this.name, this.imgPath, this.overview, this.rating, this.rateCount,
      this.genres, this.id, this.durationMins, this.releaseDate, this.genreIds);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
  
  List<Genre> getGenres() {
    if(genres!=null) {
      return getGenres();
    } else {
      return genreIds!.map((id) => Genre(AppConstants.genres[id]!, id)).toList();
    }
  }
}