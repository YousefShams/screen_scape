import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/error_handler.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/error_handling/response_status.dart';
import 'package:screen_scape/data/mapper/mapper.dart';
import 'package:screen_scape/domain/repositories/movies_repository.dart';
import '../../domain/models/movie.dart';
import '../datasources/movies_datasource.dart';

class MoviesRepository extends BaseMoviesRepository {

  static late final MoviesRepository _instance;

  final BaseMoviesDatasource moviesDS;
  MoviesRepository._internal(this.moviesDS);

  factory MoviesRepository() => _instance;

  static Future init() async {
    _instance = MoviesRepository._internal(MoviesDatasource());
  }

  @override
  Future<Either<Failure, Movie>> getMovieByID(dynamic id) async {
    
    try {
      final response = await moviesDS.getMovieByID("$id");
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
      final response = await moviesDS.getMoviesList(listPath, page: page);
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

}