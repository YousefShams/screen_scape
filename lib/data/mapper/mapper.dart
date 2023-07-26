
import 'package:screen_scape/data/response/response.dart';
import 'package:screen_scape/domain/models/movie.dart';

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