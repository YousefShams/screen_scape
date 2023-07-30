
import 'package:screen_scape/data/paths/movie_paths.dart';
import 'package:screen_scape/data/paths/paths.dart';

import '../mapper/mapper.dart';

class CurrentEntity {

  static Paths _currentPaths = MoviesPaths();
  static BaseMapper _currentMapper = MovieMapper();

  static void updateCurrentEntity(Paths paths, BaseMapper mapper) {
    _currentPaths = paths;
    _currentMapper = mapper;
  }

  static Paths getCurrentEntityPath() {
    return _currentPaths;
  }

  static BaseMapper getCurrentEntityMapper() {
    return _currentMapper;
  }
}