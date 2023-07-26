import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {

  static const appTitle = "ScreenScape";
  static const baseUrl = "https://api.themoviedb.org/3/movie";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const nowPlayingPath = "/now_playing";
  static const popularPath = "/popular";
  static const topRatedPath = "/top_rated";
  static final apiKey = "?api_key=${dotenv.env["API_KEY"]}";
  static final token = dotenv.env["TOKEN"];
  static final Map<int, String> genres = {28: 'Action', 12: 'Adventure', 16: 'Animation', 35: 'Comedy', 80: 'Crime', 99: 'Documentary', 18: 'Drama', 10751: 'Family', 14: 'Fantasy', 36: 'History', 27: 'Horror', 10402: 'Music', 9648: 'Mystery', 10749: 'Romance', 878: 'Science Fiction', 10770: 'TV Movie', 53: 'Thriller', 10752: 'War', 37: 'Western',};

}