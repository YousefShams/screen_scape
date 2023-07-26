import 'dart:convert';
import 'package:screen_scape/data/response/response.dart';
import '../apis/remote/remote_api.dart';


abstract class BaseMoviesDatasource {

  Future<MovieResponse> getMovieByID(String id);

  Future<MoviesListResponse> getMoviesList(String listPath, {int page = 1});

}


class MoviesDatasource extends BaseMoviesDatasource {

  final RemoteApi remoteApi;

  static late final MoviesDatasource _instance;

  MoviesDatasource._internal(this.remoteApi);

  factory MoviesDatasource() => _instance;


  static Future init() async {
    _instance = MoviesDatasource._internal(RemoteApi());

  }


  @override
  Future<MovieResponse> getMovieByID(String id) async {
    final result = await remoteApi.get(id);
    return MovieResponse(jsonDecode(result.body), status: result.statusCode);
  }

  @override
  Future<MoviesListResponse> getMoviesList(String listPath, {int page = 1}) async {
    final result = await remoteApi.get(listPath, query: "&page=$page");
    final data = List<Map<String, dynamic>>.from(jsonDecode(result.body)["results"]);
    return MoviesListResponse(data, status: result.statusCode);
  }


}