
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaWatchlistUseCase extends BaseUseCase<void, List<Media>> {
  final MediaRepository mediaRepo;
  GetMediaWatchlistUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, List<Media>>> execute(void input) async {
    return await mediaRepo.getMediaWatchlist();
  }


}