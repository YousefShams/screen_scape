import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/presentation/home/view/components/home_genre_item.dart';
import '../../../../domain/models/media.dart';

class HomeGenresList extends StatelessWidget {
  final List<String> genres;
  final List<List<Media>> genreMovies;
  const HomeGenresList({Key? key, required this.genres, required this.genreMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (_,index) => genreMovies[index].isEmpty ? const SizedBox.shrink():
        HomeGenreItem(
          genreName: genres[index],
          movies: genreMovies[index], shadowColor: AppColors.appGenresColors[index],)
      ),
    );
  }
}
