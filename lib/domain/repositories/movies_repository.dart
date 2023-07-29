import 'package:dartz/dartz.dart';
import 'package:screen_scape/domain/models/credits.dart';
import 'package:screen_scape/domain/models/movie.dart';
import '../../data/error_handling/failure.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, Movie>> getMovieByID(String id);

  Future<Either<Failure, List<Movie>>> getMoviesList(String listPath, {int page = 1});

  Future<Either<Failure, List<List<Movie>>>> getMoviesOfGenres(String listPath,
      List<String> genres , {int page = 1});

  Future<Either<Failure, List<String>>> getMovieImages(int id);

  Future<Either<Failure, Credits>> getMovieCredits(int id);
}