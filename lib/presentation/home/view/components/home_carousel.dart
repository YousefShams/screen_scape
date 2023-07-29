import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/presentation/home/view/components/home_carousel_item.dart';
import '../../../../domain/models/movie.dart';


class HomeCarousel extends StatelessWidget {
  final List<Movie> movies;
  final List<Color> colors;
  final PageController pageController;
  const HomeCarousel({Key? key, required this.movies, required this.pageController, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.getHeight()*0.4,
      child: PageView.builder(
        padEnds: false,
        pageSnapping: false,
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:  movies.length,
        itemBuilder: (context, i) =>
            HomeCarouselItem(movie: movies[i], color: colors[i], index: i,),
      ),
    );
  }
}
