
import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class SetMediaRegionUseCase extends BaseUseCase<String?,void> {
  final MediaRepository mediaRepo;
  SetMediaRegionUseCase(this.mediaRepo);
  @override
  Future<Either<Failure, void>> execute(String? input) async {
    final result = await mediaRepo.setRegion(input);
    return result;
  }


}