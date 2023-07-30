import 'package:flutter/material.dart';
import 'package:screen_scape/presentation/home/view/components/home_movie_item.dart';
import '../../../../domain/models/media.dart';

class HomeMoviesList extends StatelessWidget {
  final List<Media> movies;
  const HomeMoviesList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_,index) => HomeMovieItem(movie: movies[index])
      ),
    );
  }
}
