import 'package:dartz/dartz.dart';
import 'package:screen_scape/data/error_handling/failure.dart';
import 'package:screen_scape/data/repositories/media_repository.dart';
import 'package:screen_scape/domain/use_cases/base_usecase.dart';

import '../models/member_credits.dart';

class GetMediaCreditsUseCase extends BaseUseCase<String,MemberCredits>  {

  final MediaRepository mediaRepo;
  GetMediaCreditsUseCase(this.mediaRepo);

  @override
  Future<Either<Failure, MemberCredits>> execute(String input) async {
    return await mediaRepo.getMediaCredits(input);
  }


}