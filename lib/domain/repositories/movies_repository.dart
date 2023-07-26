import 'package:dartz/dartz.dart';
import 'package:screen_scape/domain/models/movie.dart';
import '../../data/error_handling/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, Movie>> getMovieByID(String id);

  Future<Either<Failure, List<Movie>>> getMoviesList(String listPath, {int page = 1});
}