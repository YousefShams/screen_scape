import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/error_handler.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/error_handling/response_status.dart';
import 'package:screen_scape/data/mapper/mapper.dart';
import 'package:screen_scape/domain/models/credits.dart';
import 'package:screen_scape/domain/repositories/movies_repository.dart';
import '../../domain/models/movie.dart';
import '../datasources/movies_datasource.dart';


class MoviesRepository extends BaseMoviesRepository {

  static late final MoviesRepository _instance;

  final BaseMoviesDatasource _moviesDS;
  MoviesRepository._internal(this._moviesDS);

  factory MoviesRepository() => _instance;

  static Future init() async {
    _instance = MoviesRepository._internal(MoviesDatasource());
  }

  @override
  Future<Either<Failure, Movie>> getMovieByID(dynamic id) async {
    
    try {
      final response = await _moviesDS.getMovieByID("$id");
      final errorHandler = ErrorHandler(response.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }
      
      else {
        return Right(response.getMovie());
      }
    }
    
    catch(e) {
      if(e is SocketException) {
        return Left(StatusTypes.NO_CONNECTION.getFailure());
      }
      else {
        return Left(Failure(e.toString(), StatusCodes.UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getMoviesList(String listPath, {int page = 1}) async {
    try {
      final response = await _moviesDS.getMoviesList(listPath, page: page);
      final errorHandler = ErrorHandler(response.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(response.getMoviesList());
      }
    }

    catch(e) {
      if(e is SocketException) {
        return Left(StatusTypes.NO_CONNECTION.getFailure());
      }
      else {
        return Left(Failure(e.toString(), StatusCodes.UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, List<List<Movie>>>> getMoviesOfGenres(String listPath,
      List<String> genres, {int page = 1}) async {
    try {

      final responses = await _moviesDS.getMoviesOfGenres(listPath, genres, page: page);

      final errorResponses = responses.where((e) => ErrorHandler(e.statusCode).hasError).toList();

      if(errorResponses.isNotEmpty) {
        return Left(ErrorHandler(errorResponses.first.statusCode).failure);
      }

      else {
        final result = responses.map((e) => e.getMoviesList()).toList();
        return Right(result);
      }
    }

    catch(e) {
      if(e is SocketException) {
        return Left(StatusTypes.NO_CONNECTION.getFailure());
      }
      else {
        return Left(Failure(e.toString(), StatusCodes.UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, List<String>>> getMovieImages(int id) async {
    try {
      final imagesResponse = await _moviesDS.getMovieImages(id);
      final errorHandler = ErrorHandler(imagesResponse.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(imagesResponse.getImagesList());
      }
    }

    catch(e) {
      if(e is SocketException) {
        return Left(StatusTypes.NO_CONNECTION.getFailure());
      }
      else {
        return Left(Failure(e.toString(), StatusCodes.UNKNOWN));
      }
    }
  }

  @override
  Future<Either<Failure, Credits>> getMovieCredits(int id) async {

    try{
      final creditsResponse = await _moviesDS.getMovieCredits(id);
      final errorHandler = ErrorHandler(creditsResponse.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(creditsResponse.getMovieCredits());
      }
    }

    catch(e) {
      if(e is SocketException) {
        return Left(StatusTypes.NO_CONNECTION.getFailure());
      }
      else {
        return Left(Failure(e.toString(), StatusCodes.UNKNOWN));
      }
    }
  }

}