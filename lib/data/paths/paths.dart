abstract class Paths {
  static String get nowPlayingPath => "/now_playing";

  static String get popularPath => "/popular";

  static String get topRatedPath   => "/top_rated";

  static String get searchPath   => "/search/multi";

  static String personDetailsPath(id)   => "/person/$id";

  static String get personDetailsQuery   => r"append_to_response=combined_credits%2Cimages";

  static String detailsPath(String id) => "/$id";

  static String imagesPath (int movieId) => "/$movieId/images";

  static String creditsPath(int movieId) => "/$movieId/credits";

  static String videosPath(int movieId) => "/$movieId/videos";

  static String discoverPath(String base) => "/discover$base";

  String get name;

  String get basePath;

  String get topPath;
}