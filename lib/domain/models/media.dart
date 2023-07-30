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

  final String releaseDate;


  const Media(this.name, this.imgPath, this.overview, this.rating, this.rateCount,
      this.genres, this.id, /*this.durationMins, this.releaseDate,*/ this.genreIds, this.popularity, this.releaseDate);

  // factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$MediaToJson(this);
  
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


  // DateTime get dateTime {
  //   final ymd = releaseDate.split('-').map((e) => int.parse(e)).toList();
  //   return DateTime(ymd.first, ymd[1], ymd.last);
  // }
}