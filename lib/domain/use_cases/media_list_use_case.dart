
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

import '../models/media.dart';

class GetMediaListUseCase extends BaseUseCase<GetMediaListUseCaseInputs,
    List<Media>>  {

  final MediaRepository mediaRepo;
  GetMediaListUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, List<Media>>> execute(GetMediaListUseCaseInputs
  input) async {
    return await mediaRepo.getMediaList(input.listPath, page: input.page);
  }
  
}

class GetMediaListUseCaseInputs {
  final String listPath;
  final int page;

  const GetMediaListUseCaseInputs(this.listPath,this.page);
}