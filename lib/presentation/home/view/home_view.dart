
import 'package:flutter/material.dart';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import 'package:screen_scape/presentation/home/view/components/home_carousel.dart';
import 'package:screen_scape/presentation/home/view/components/home_current_now_playing.dart';
import 'package:screen_scape/presentation/home/view/components/home_genre_list.dart';
import 'package:screen_scape/presentation/home/view/components/home_movies_list.dart';
import 'package:screen_scape/presentation/home/view/components/home_now_playing.dart';
import 'components/home_cubit_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeCubitWidget(
      builder: (cubit) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTitle(title: AppStrings.nowPlaying),
              HomeCarousel(movies: cubit.nowPlayingMovies, colors: cubit.nowPlayingColors,
                  pageController: cubit.pageController),
              HomeCurrentNowPlaying(movies: cubit.nowPlayingMovies,
              currentIndex: cubit.currentIndex.toInt(),),
              const HomeTitle(title: AppStrings.topRated),
              HomeMoviesList(movies: cubit.topRatedMovies),
              const HomeTitle(title: AppStrings.genres),
              HomeGenresList(genres: AppConstants.appViewGenres,
                  genreMovies: cubit.genresMovies)

            ],
          ),
        ),
      )
    );
  }
}
