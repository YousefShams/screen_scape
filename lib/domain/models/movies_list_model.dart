import 'media.dart';

class MoviesListData {

  final String title;
  final String path;
  final int? genreId;
  final List<Media> movies;

  const MoviesListData(this.title, this.movies, this.path, this.genreId);
}