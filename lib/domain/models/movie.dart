import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'genre.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie extends Media {

  @JsonKey(name : "runtime")
  final int? durationMins;

  Movie(super.name, super.imgPath, super.overview, super.rating, super.rateCount, super.genres, super.id, super.genreIds, super.popularity, super.releaseDate, super.type, this.durationMins);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}