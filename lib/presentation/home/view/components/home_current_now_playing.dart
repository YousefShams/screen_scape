import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/movie.dart';

class HomeCurrentNowPlaying extends StatelessWidget {
  final List<Movie> movies;
  final int currentIndex;
  const HomeCurrentNowPlaying({Key? key, required this.movies, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movies.isEmpty ? const SizedBox.shrink() :
    Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(horizontal:AppPadding.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(movies[currentIndex].name, style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1,),
          const SizedBox(height: 7),
          Text(movies[currentIndex].getGenres().first.name, style: Theme.of(context).textTheme.labelMedium,),
        ],
      ),
    );
  }
}
