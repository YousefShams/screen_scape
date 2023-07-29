import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {

  //APP
  static const appTitle = "ScreenScape";


  //URLS
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const nowPlayingMoviesPath = "/movie/now_playing";
  static const topRatedMoviesPath = "/movie/top_rated";
  static const discoverMoviesPath = "/discover/movie";

  static const nowPlayingTVsPath = "/tv/now_playing";
  static const topRatedTVPath = "/tv/top_rated";

  static String movieImagesPath(int movieId) => "/movie/$movieId/images";
  static String movieCreditsPath(int movieId) => "/movie/$movieId/credits";


  //SECRETS
  static final apiKey = "?api_key=${dotenv.env["API_KEY"]}";
  static final token = dotenv.env["TOKEN"];


  //GENRES
  static final Map<int, String> genres = {28: 'Action', 12: 'Adventure',
    16: 'Animation', 35: 'Comedy', 80: 'Crime', 99: 'Documentary', 18: 'Drama',
    14: 'Fantasy', 36: 'History', 27: 'Horror', 10402: 'Music', 9648: 'Mystery',
    10749: 'Romance', 878: 'Science Fiction', 10770: 'TV Movie', 53: 'Thriller',
    10752: 'War', 37: 'Western', 10751: 'Family',};

  static final appViewGenres = ["drama", "thriller", "horror", "animation", "family", "music"];

  //DURATIONS
  static const splashTime = 0;

}