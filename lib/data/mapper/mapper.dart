import 'package:screen_scape/data/response/response.dart';
import 'package:screen_scape/domain/models/cast_member.dart';
import 'package:screen_scape/domain/models/movie.dart';

import '../../domain/models/credits.dart';
import '../../domain/models/crew_member.dart';

extension MovieMapper on MovieResponse {
  Movie getMovie() {
    return Movie.fromJson(data);
  }

}

extension MoviesListMapper on MoviesListResponse {

  List<Movie> getMoviesList() {
    return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
  }
}

extension ImagesListMapper on ImagesListResponse {

  List<String> getImagesList() {
    return data.map((e) => "${e["file_path"]}").toList();
  }
}


extension CreditsResponseMapper on CreditsResponse {
  Credits getMovieCredits() {
    final castListJson = List<Map<String,dynamic>>.from(data["cast"]);
    final crewListJson = List<Map<String,dynamic>>.from(data["crew"]);


    final cast = castListJson.map((json) => CastMember.fromJson(json)).toList();
    final crew = crewListJson.map((json) => CrewMember.fromJson(json)).toList();

    return Credits(cast, crew);
  }
}