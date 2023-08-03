import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/media_video.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaVideosUseCase extends BaseUseCase<String,List<MediaVideo>>  {

  final MediaRepository mediaRepo;
  GetMediaVideosUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, List<MediaVideo>>> execute(String input) async {
    return await mediaRepo.getMediaVideo(input);
  }


}