import 'package:dartz/dartz.dart';
import 'package:screen_scape/domain/models/member_credits.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import '../../data/error_handling/failure.dart';
import '../models/person.dart';
import '../models/search_results.dart';

abstract class BaseMediaRepository {
  Future<Either<Failure, Media>> getMediaByID(String id);

  Future<Either<Failure, List<Media>>> getMediaList(String listPath, {int page = 1});

  Future<Either<Failure, List<List<Media>>>> getMediaOfGenres(String listPath,
      List<int> genres , {int page = 1});

  Future<Either<Failure, List<String>>> getMediaImages(String path);

  Future<Either<Failure, MemberCredits>> getMediaCredits(String path);

  Future<Either<Failure, List<MediaVideo>>> getMediaVideo(String path);

  Future<Either<Failure, SearchResults>> getSearchedMedia(String searchText, int page);

  Future<Either<Failure, Person>> getPersonDetails(int id);

}