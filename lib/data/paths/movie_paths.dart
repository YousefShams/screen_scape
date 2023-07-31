
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/data/paths/paths.dart';

class MoviesPaths implements Paths {

  @override
  String get basePath => AppConstants.moviePath;

  @override
  String get topPath => Paths.nowPlayingPath;

}