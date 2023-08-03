import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaSingleUseCase extends BaseUseCase<String,Media>  {

  final MediaRepository mediaRepo;
  GetMediaSingleUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, Media>> execute(String input) async {
    return await mediaRepo.getMediaByID(input);
  }


}