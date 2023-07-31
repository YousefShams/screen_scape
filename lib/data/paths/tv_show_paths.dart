import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/data/paths/paths.dart';

class TVShowPaths implements Paths {

  @override
  String get basePath => AppConstants.tvPath;

  @override
  String get topPath => Paths.popularPath;
}