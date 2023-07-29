import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/page_title.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/domain/models/genre_movies_model.dart';
import 'package:screen_scape/presentation/genre_movies/view/components/genre_movies_grid.dart';

import 'components/genre_movies_title.dart';

class GenreMovieScreen extends StatelessWidget {
  const GenreMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreMovies = ModalRoute.of(context)!.settings.arguments as GenreMovies;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenreMoviesTitle(title: genreMovies.genreName),
          GenreMoviesGrid(movies: genreMovies.movies)
        ],
      )
    );
  }
}
