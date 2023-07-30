import 'package:screen_scape/data/response/response.dart';
import 'package:screen_scape/domain/models/cast_member.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/domain/models/tv_show.dart';
import '../../domain/models/credits.dart';
import '../../domain/models/crew_member.dart';
import '../../domain/models/movie.dart';

abstract class BaseMapper {
  Media getObject(Map<String,dynamic> data);
  List<Media> getObjectList(List<Map<String,dynamic>> data);
}


class MovieMapper extends BaseMapper {
  @override
  Movie getObject(Map<String,dynamic> data) {
    return Movie.fromJson(data);
  }

  @override
  List<Movie> getObjectList(List<Map<String,dynamic>> data) {
    return data.map((movieJson) => Movie.fromJson(movieJson)).toList();
  }
}

class TVShowMapper extends BaseMapper {
  @override
  TVShow getObject(Map<String,dynamic> data) {
    return TVShow.fromJson(data);
  }

  @override
  List<TVShow> getObjectList(List<Map<String,dynamic>> data) {
    return data.map((tvShowJson) => TVShow.fromJson(tvShowJson)).toList();
  }
}




extension ImagesListMapper on ImagesListResponse {
  List<String> getImagesList() {
    return data.map((e) => "${e["file_path"]}").toList();
  }
}


extension CreditsResponseMapper on CreditsResponse {
  Credits getMovieCredits() {
    final castListJson = List<Map<String,dynamic>>.from(data["cast"]);
    final crewListJson = List<Map<String,dynamic>>.from(data["crew"]);

    final cast = castListJson.map((json) => CastMember.fromJson(json)).toList();
    final crew = crewListJson.map((json) => CrewMember.fromJson(json)).toList();

    return Credits(cast, crew);
  }
}

extension VideosMapper on VideosResponse {

  List<MediaVideo> getVideos() {
    final videosJson = List<Map<String,dynamic>>.from(data["results"]);
    return videosJson.map((vidJson) => MediaVideo.fromJson(vidJson)).toList();
  }

}