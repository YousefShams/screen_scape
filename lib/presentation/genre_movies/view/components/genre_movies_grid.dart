import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/presentation/genre_movies/view/components/genre_movies_item.dart';

import '../../../../domain/models/movie.dart';

class GenreMoviesGrid extends StatelessWidget {
  final List<Movie> movies;
  const GenreMoviesGrid({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(p,0,p,0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20 , crossAxisSpacing: 15,
            childAspectRatio: 1.6/3
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) => GenreMoviesItem(movie: movies[index])
        ),
      ),
    );
  }
}
