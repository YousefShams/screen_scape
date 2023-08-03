
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

import '../models/media.dart';

class GetMediaGenresUseCase extends BaseUseCase<GetMediaGenresUseCaseInputs,
    List<List<Media>>>  {

  final MediaRepository mediaRepo;
  GetMediaGenresUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, List<List<Media>>>> execute(GetMediaGenresUseCaseInputs
  input) async {

    return await mediaRepo.getMediaOfGenres(input.listPath, input.genres,
      page: input.page
    );
  }


}

class GetMediaGenresUseCaseInputs {
  final String listPath;
  final List<int> genres;
  final int page;

  const GetMediaGenresUseCaseInputs(this.listPath, this.genres, this.page);
}