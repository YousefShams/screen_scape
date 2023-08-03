import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/models/person.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

class GetMediaPersonUseCase extends BaseUseCase<int,Person>  {

  final MediaRepository mediaRepo;
  GetMediaPersonUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, Person>> execute(int input) async {
    return await mediaRepo.getPersonDetails(input);
  }


}