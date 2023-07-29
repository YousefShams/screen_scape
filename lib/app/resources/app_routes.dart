import 'package:flutter/material.dart';
import 'package:screen_scape/presentation/genre_movies/view/genre_movies_view.dart';
import 'package:screen_scape/presentation/home/view/home_view.dart';
import 'package:screen_scape/presentation/movie_details/view/movie_details_view.dart';
import '../../presentation/onboarding/view/onboarding_view.dart';
import '../../presentation/splash/view/splash_view.dart';
import '../transition/page_transition.dart';

class AppRoutes {

  static const splashRoute = "/splash";
  static const onboardingRoute = "/onboarding";
  static const homeRoute = "/home";
  static const movieDetailsRoute = "/movie-details";
  static const genreMoviesRoute = "/genre-movies";




  static final screens = {
    splashRoute : const SplashScreen(),
    onboardingRoute : const OnboardingScreen(),
    homeRoute: const HomeScreen(),
    movieDetailsRoute : const MovieDetailsScreen(),
    genreMoviesRoute : const GenreMovieScreen()
  };

  static Widget getScreenFromRoute(String? route) {
    return screens[route] ?? const Scaffold();
  }

  static Route onGenerateRoute (RouteSettings route) {
    return PageTransition(getScreenFromRoute(route.name), setting: route);
  }

}