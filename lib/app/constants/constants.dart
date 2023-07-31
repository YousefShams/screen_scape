import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {

  //APP
  static const appTitle = "ScreenScape";


  //URLS
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const moviePath = "/movie";
  static const tvPath = "/tv";



  //SECRETS
  static final apiKey = "?api_key=${dotenv.env["API_KEY"]}";
  static final token = dotenv.env["TOKEN"];


  //GENRES
  static final Map<int, String> genres = {28: 'Action', 12: 'Adventure',
    16: 'Animation', 35: 'Comedy', 80: 'Crime', 99: 'Documentary', 18: 'Drama',
    14: 'Fantasy', 36: 'History', 27: 'Horror', 10402: 'Music', 9648: 'Mystery',
    10749: 'Romance', 878: 'Science Fiction', 10770: 'TV Movie', 53: 'Thriller',
    10752: 'War', 37: 'Western', 10751: 'Family', 10763: "Anime", 10766: "Soap",
    10759: "Action & Adventure", 10765: "Sci-Fi & Fantasy", 10764: "Reality",
    -1 : "Other"
  };

  static final List<int> appViewGenres = [18, 16, 27, 10402, 10751, 99, 10749];

  //DURATIONS
  static const splashTime = 5;

}