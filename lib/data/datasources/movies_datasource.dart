import 'dart:convert';
import 'package:screen_scape/app/constants/constants.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/data/response/response.dart';
import '../apis/remote/remote_api.dart';


abstract class BaseMoviesDatasource {

  Future<MovieResponse> getMovieByID(String id);

  Future<MoviesListResponse> getMoviesList(String listPath, {int page = 1});

  Future<List<MoviesListResponse>> getMoviesOfGenres(String listPath,
      List<String> genres, {int page = 1});

  Future<ImagesListResponse> getMovieImages(int id);
  
  Future<CreditsResponse> getMovieCredits(int id);
}


class MoviesDatasource extends BaseMoviesDatasource {

  final RemoteApi _remoteApi;

  static late final MoviesDatasource _instance;

  MoviesDatasource._internal(this._remoteApi);

  factory MoviesDatasource() => _instance;


  static Future init() async {
    _instance = MoviesDatasource._internal(RemoteApi());
  }


  @override
  Future<MovieResponse> getMovieByID(String id) async {
    final result = await _remoteApi.get(id);
    return MovieResponse(jsonDecode(result.body), status: result.statusCode);
  }

  @override
  Future<MoviesListResponse> getMoviesList(String listPath, {int page = 1}) async {
    final result = await _remoteApi.get(listPath, query: "&page=$page");
    final data = List<Map<String, dynamic>>.from(jsonDecode(result.body)["results"]);
    return MoviesListResponse(data, status: result.statusCode);
  }

  @override
  Future<List<MoviesListResponse>> getMoviesOfGenres(String listPath, 
      List<String> genres, {int page = 1}) async {


    final ids = genres.map((e) => AppFunctions.getGenreIDFromString(e)).toList();

    final paths = List.filled(ids.length, listPath);

    final queries = ids.map((id) => "with_genres=$id&page=$page").toList();

    final responses = await _remoteApi.getMultiple(paths, queries);

    final moviesResponses = responses.map((e) =>
        MoviesListResponse(
            List<Map<String, dynamic>>.from(jsonDecode(e.body)["results"]),
            status: e.statusCode
    )).toList();


    return moviesResponses;
  }

  @override
  Future<ImagesListResponse> getMovieImages(int id) async {
    final response = await _remoteApi.get(AppConstants.movieImagesPath(id));
    final result = List<Map<String,dynamic>>.from(jsonDecode(response.body)["backdrops"]) ;
    return ImagesListResponse(result, status: response.statusCode);
  }

  @override
  Future<CreditsResponse> getMovieCredits(int id) async {
    final jsonResponse = await _remoteApi.get(AppConstants.movieCreditsPath(id));
    final responseData = jsonDecode(jsonResponse.body);
    return CreditsResponse(responseData, status: jsonResponse.statusCode);
  }





}