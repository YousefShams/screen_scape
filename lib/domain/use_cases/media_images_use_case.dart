
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaImagesUseCase extends BaseUseCase<String,List<String>>  {

  final MediaRepository mediaRepo;
  GetMediaImagesUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, List<String>>> execute(String input) async {
    return await mediaRepo.getMediaImages(input);
  }


}