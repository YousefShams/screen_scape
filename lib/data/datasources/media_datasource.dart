import 'dart:convert';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/data/response/response.dart';
import '../apis/remote/remote_api.dart';


abstract class BaseMediaDatasource {

  Future<MediaResponse> getMediaByID(String id);

  Future<MediaListResponse> getMediaList(String listPath, {int page = 1});

  Future<List<MediaListResponse>> getMediaOfGenres(String listPath,
      List<String> genres, {int page = 1});

  Future<ImagesListResponse> getMediaImages(String path);
  
  Future<CreditsResponse> getMediaCredits(String path);

  Future<VideosResponse> getMediaVideos(String path);

}


class MediaDatasource extends BaseMediaDatasource {
  final RemoteApi _remoteApi;


  MediaDatasource(this._remoteApi);
  // static late final MediaDatasource _instance;
  //
  // MediaDatasource._internal(this._remoteApi, this.value);
  //
  // factory MediaDatasource() => _instance as MediaDatasource<T>;
  //
  // static Future init() async {
  //   _instance = MediaDatasource._internal(RemoteApi());
  // }

  @override
  Future<MediaResponse> getMediaByID(String id) async {
    final result = await _remoteApi.get(Paths.detailsPath(id));
    return MediaResponse(jsonDecode(result.body), status: result.statusCode);
  }

  @override
  Future<MediaListResponse> getMediaList(String listPath, {int page = 1}) async {
    final result = await _remoteApi.get(listPath,
        query: "&page=$page");

    final data = List<Map<String, dynamic>>.from(
        jsonDecode(result.body)["results"]);

    return MediaListResponse(data, status: result.statusCode);
  }

  @override
  Future<List<MediaListResponse>> getMediaOfGenres(String listPath,
      List<String> genres, {int page = 1}) async {

    final ids = genres.map((e) => AppFunctions.getGenreIDFromString(e)).toList();

    final paths = List.filled(ids.length, listPath);

    final queries = ids.map((id) => "with_genres=$id&page=$page").toList();

    final responses = await _remoteApi.getMultiple(paths, queries);

    final mediaResponses = responses.map((e) =>
        MediaListResponse(
            List<Map<String, dynamic>>.from(jsonDecode(e.body)["results"]),
            status: e.statusCode
    )).toList();


    return mediaResponses;
  }

  @override
  Future<ImagesListResponse> getMediaImages(String path) async {
    final response = await _remoteApi.get(path);
    final result = List<Map<String,dynamic>>.from(jsonDecode(response.body)["backdrops"]) ;
    return ImagesListResponse(result, status: response.statusCode);
  }

  @override
  Future<CreditsResponse> getMediaCredits(String path) async {
    final jsonResponse = await _remoteApi.get(path);
    final responseData = jsonDecode(jsonResponse.body);
    return CreditsResponse(responseData, status: jsonResponse.statusCode);
  }

  @override
  Future<VideosResponse> getMediaVideos(String path) async {
    final response = await _remoteApi.get(path);
    final responseData = jsonDecode(response.body);
    return VideosResponse(responseData, status: response.statusCode);
  }


}

//
// class MovieDatasource extends MediaDatasource{
//
//   static late final MovieDatasource _instance;
//
//   MovieDatasource._internal(super.remoteApi, super.value);
//
//   factory MovieDatasource() => _instance;
//
//   static Future init() async {
//     _instance = MovieDatasource._internal(RemoteApi(), MoviesPaths());
//   }
//
// }
//
//
// class TVShowDatasource extends MediaDatasource{
//
//   static late final TVShowDatasource _instance;
//
//   TVShowDatasource._internal(super.remoteApi, super.value);
//
//   factory TVShowDatasource() => _instance;
//
//   static Future init() async {
//     _instance = TVShowDatasource._internal(RemoteApi(), TVShowPaths());
//   }
//
// }