import 'package:flutter/material.dart';
import 'package:screen_scape/presentation/country_pick/view/country_pick_view.dart';
import 'package:screen_scape/presentation/movies_list/view/movies_list_view.dart';
import 'package:screen_scape/presentation/home/view/home_view.dart';
import 'package:screen_scape/presentation/movie_details/view/movie_details_view.dart';
import 'package:screen_scape/presentation/person/view/person_view.dart';
import 'package:screen_scape/presentation/search/view/search_view.dart';
import 'package:screen_scape/presentation/watchlist/view/watchlist_view.dart';
import '../../presentation/onboarding/view/onboarding_view.dart';
import '../../presentation/splash/view/splash_view.dart';
import '../transition/page_transition.dart';

class AppRoutes {

  static const splashRoute = "/splash";
  static const onboardingRoute = "/onboarding";
  static const homeRoute = "/home";
  static const movieDetailsRoute = "/movie-details";
  static const moviesListRoute = "/movies-list";
  static const searchRoute = "/search";
  static const watchlistRoute = "/watch-list";
  static const personRoute = "/person";
  static const countryRoute = "/country";








  static final screens = {
    splashRoute : const SplashScreen(),
    onboardingRoute : const OnboardingScreen(),
    homeRoute: const HomeScreen(),
    movieDetailsRoute : const MovieDetailsScreen(),
    moviesListRoute : const MoviesListScreen(),
    searchRoute : const SearchScreen(),
    watchlistRoute: const WatchlistScreen(),
    personRoute : const PersonScreen(),
    countryRoute : const CountryPickScreen()
  };

  static Widget getScreenFromRoute(String? route) {
    return screens[route] ?? const Scaffold();
  }

  static Route onGenerateRoute (RouteSettings route) {
    return PageTransition(getScreenFromRoute(route.name), setting: route);
  }

}