import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/datasources/media_datasource.dart';
import 'package:screen_scape/data/error_handling/error_handler.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/error_handling/response_status.dart';
import 'package:screen_scape/data/mapper/mapper.dart';
import 'package:screen_scape/domain/models/credits.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/domain/repositories/media_repository.dart';


class MediaRepository extends BaseMediaRepository {

  // static late final MediaRepository _instance;
  //
  // final BaseMediaDatasource _mediaDS;
  // MediaRepository._internal(this._mediaDS);
  //
  // factory MediaRepository() => _instance;
  //
  // static Future init() async {
  //   _instance = MediaRepository._internal(MediaDatasource());
  // }

  final BaseMediaDatasource _mediaDS;
  final BaseMapper mapper;
  MediaRepository(this._mediaDS, this.mapper);



  @override
  Future<Either<Failure, List<String>>> getMediaImages(String path) async {
    try {
      final imagesResponse = await _mediaDS.getMediaImages(path);
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
  Future<Either<Failure, Credits>> getMediaCredits(String path) async {

    try{
      final creditsResponse = await _mediaDS.getMediaCredits(path);
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

  @override
  Future<Either<Failure, List<Media>>> getMediaList
      (String listPath, {int page = 1}) async {

    try {
      final response = await _mediaDS.getMediaList(listPath, page: page);

      final errorHandler = ErrorHandler(response.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(mapper.getObjectList(response.data));
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
  Future<Either<Failure, List<List<Media>>>> getMediaOfGenres(String listPath,
      List<String> genres, {int page = 1}) async {
    try {

      final responses = await _mediaDS.getMediaOfGenres(listPath, genres, page: page);

      final errorResponses = responses.where((e) => ErrorHandler(e.statusCode).hasError).toList();

      if(errorResponses.isNotEmpty) {
        return Left(ErrorHandler(errorResponses.first.statusCode).failure);
      }

      else {
        final result = responses.map((e) => mapper.getObjectList(e.data)).toList();
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
  Future<Either<Failure, Media>> getMediaByID(String id) async {
    try {
      final response = await _mediaDS.getMediaByID(id);
      final errorHandler = ErrorHandler(response.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(mapper.getObject(response.data));
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
  Future<Either<Failure, List<MediaVideo>>> getMediaVideo(String path) async {
    try {
      final response = await _mediaDS.getMediaVideos(path);
      final errorHandler = ErrorHandler(response.statusCode);

      if(errorHandler.hasError) {
        return Left(errorHandler.failure);
      }

      else {
        return Right(response.getVideos());
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