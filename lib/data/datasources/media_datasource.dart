// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'package:screen_scape/app/resources/app_databases_keys.dart';
import 'package:screen_scape/data/apis/local/local_api.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/data/queries/query.dart';
import 'package:screen_scape/data/response/response.dart';
import '../apis/remote/remote_api.dart';

abstract class BaseMediaDatasource {

  Future<MediaResponse> getMediaByID(String id);

  Future<MediaListResponse> getMediaList(String listPath, {int page = 1});

  Future<List<MediaListResponse>> getMediaOfGenres(String listPath,
      List<int> genres, {int page = 1});

  Future<ImagesListResponse> getMediaImages(String path);
  
  Future<CreditsResponse> getMediaCredits(String path);

  Future<VideosResponse> getMediaVideos(String path);

  Future<SearchResponse> getSearchedMedia(String path, String searchText, int page);

  Future<PersonResponse> getPersonDetails(int id);

  Future<MediaListLocalResponse> getMediaWatchlist();

  Future setRegion(String? countryCode);
}


class MediaDatasource extends BaseMediaDatasource {
  final RemoteApi _remoteApi;
  final LocalApi _localApi;
  MediaDatasource(this._remoteApi, this._localApi);

  @override
  Future<MediaResponse> getMediaByID(String id) async {
    final result = await _remoteApi.get(Paths.detailsPath(id));
    return MediaResponse(jsonDecode(result.body), status: result.statusCode);
  }

  @override
  Future<MediaListResponse> getMediaList(String listPath, {int page = 1}) async {

    final region = await _localApi.get(AppDatabasesKeys.settingsDatabase,
        AppDatabasesKeys.iso);

    String pageQuery = Query.pageQuery(page);
    final String regionQuery;

    if(!listPath.contains("playing") || region==null) regionQuery = "";
    else regionQuery = Query.regionQuery(region);


    final result = await _remoteApi.get(listPath, query: "$pageQuery&$regionQuery");

    final data = List<Map<String, dynamic>>.from(jsonDecode(result.body)["results"]);

    return MediaListResponse(data, status: result.statusCode);
  }

  @override
  Future<List<MediaListResponse>> getMediaOfGenres(String listPath,
      List<int> genres, {int page = 1}) async {

    final ids = genres;

    final paths = List.filled(ids.length, listPath);

    String pageQuery = Query.pageQuery(page);

    final queries = ids.map((id) => "${Query.genreQuery(id)}&$pageQuery").toList();

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

  @override
  Future<SearchResponse> getSearchedMedia(String path,String searchText, int page) async {
    final query = "${Query.searchQuery(searchText)}& ${Query.pageQuery(page)}";
    final response = await _remoteApi.get(path,query: query);
    final data = List<Map<String,dynamic>>.from(jsonDecode(response.body)["results"]);
    return SearchResponse(data, status: response.statusCode);
  }

  @override
  Future<PersonResponse> getPersonDetails(int id) async {
    final response = await _remoteApi.get(Paths.personDetailsPath(id),
        query: Paths.personDetailsQuery);

    final result = jsonDecode(response.body);
    return PersonResponse(result, status: response.statusCode);
  }

  @override
  Future<MediaListLocalResponse> getMediaWatchlist() async {
    const dbName = AppDatabasesKeys.watchlistDatabase;
    final results = List<Map>.from(_localApi.getAll(dbName));
    return MediaListLocalResponse(results);
  }

  @override
  Future setRegion(String? countryCode) async {
    await _localApi.save(AppDatabasesKeys.settingsDatabase,
        {AppDatabasesKeys.iso: countryCode,
          AppDatabasesKeys.onboardingDone: true});
  }

}

