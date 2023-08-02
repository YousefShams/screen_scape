import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/bottom_nav.dart';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/functions/functions.dart';
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
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitle(title: AppFunctions.topPathTitle),
              HomeCarousel(
                  movies: cubit.nowPlayingMedia, colors: cubit.nowPlayingColors,
                  pageController: cubit.pageController
              ),
              HomeCurrentNowPlaying(movies: cubit.nowPlayingMedia,
              currentIndex: cubit.currentMediaIndex.toInt()),
              HomeTitle(title: AppStrings.topRated, media: cubit.topRatedMedia,),
              HomeMoviesList(movies: cubit.topRatedMedia),
              const HomeTitle(title: AppStrings.genres),
              HomeGenresList(
                  genres: AppConstants.appViewGenres.map((i) => AppConstants.genres[i]!).toList(),
                  genreMovies: cubit.genresMedia)

            ],
          ),
        ),
        bottomNavigationBar: DefaultBottomNavBar(
         currentIndex: cubit.currentIndex,
        )
      )
    );
  }
}
