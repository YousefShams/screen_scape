import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/search_results.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaSearchUseCase extends BaseUseCase<GetMediaSearchUseCaseInputs,
    SearchResults>  {

  final MediaRepository mediaRepo;
  GetMediaSearchUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, SearchResults>> execute(GetMediaSearchUseCaseInputs
  input) async {
    return await mediaRepo.getSearchedMedia(input.searchText , input.page);
  }


}

class GetMediaSearchUseCaseInputs {
  final String searchText;
  final int page;

  const GetMediaSearchUseCaseInputs(this.searchText,this.page);
}