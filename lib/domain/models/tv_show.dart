import 'package:json_annotation/json_annotation.dart';
import 'package:screen_scape/domain/models/media.dart';

import 'genre.dart';
part 'tv_show.g.dart';

@JsonSerializable()
class TVShow extends Media {

  @JsonKey(name : "episode_run_time")
  final List<int>? runtimes;
  @JsonKey(name : "seasons")
  final List? seasons;

  TVShow(super.name, super.imgPath, super.overview, super.rating,
      super.rateCount, super.genres, super.id, super.genreIds,
      super.popularity, super.releaseDate, this.runtimes, this.seasons);


  factory TVShow.fromJson(Map<String, dynamic> json) => _$TVShowFromJson(json);
  Map<String, dynamic> toJson() => _$TVShowToJson(this);


}