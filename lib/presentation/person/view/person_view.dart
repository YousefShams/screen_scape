import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_assets.dart';
import 'package:screen_scape/domain/use_cases/media_people_use_case.dart';
import 'package:screen_scape/presentation/person/view/components/person_bio.dart';
import 'package:screen_scape/presentation/person/view/components/person_cubit_widget.dart';
import 'package:screen_scape/presentation/person/view/components/person_image.dart';
import 'package:screen_scape/presentation/person/view/components/person_info.dart';
import 'package:screen_scape/presentation/person/view/components/person_media.dart';
import 'package:screen_scape/presentation/person/view/components/person_profile_images.dart';
import 'package:screen_scape/presentation/person/view_model/cubit.dart';
import 'package:screen_scape/presentation/person/view_model/states.dart';

import '../../../data/apis/local/local_api.dart';
import '../../../data/apis/remote/remote_api.dart';
import '../../../data/datasources/media_datasource.dart';
import '../../../data/paths/current_path.dart';
import '../../../data/repositories/media_repository.dart';
import 'components/person_blur.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final mapper = CurrentEntity.getCurrentEntityMapper();
    final repo = MediaRepository(MediaDatasource(RemoteApi(),LocalApi()), mapper);
    return PersonCubitWidget<PersonCubit, PersonState, PersonLoading, PersonError>(
      cubit: PersonCubit(GetMediaPersonUseCase(repo))..getPerson(id),
      builder: (cubit) => Scaffold(
        body: SafeArea(
          child: Stack(
          children: [
            PersonBlur(imagePath: cubit.firstMovieImage),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                          opacity: 0.7,
                          child: Lottie.asset(AppAssets.profile, height: 265, fit: BoxFit.contain)),
                      PersonImage(
                          size: 85, noPadding: true,
                          personImagePath: AppFunctions.getNetworkImagePath(cubit.person.imagePath)
                      ),
                    ],
                  ),
                  PersonInfo(name: cubit.person.name, birthDate: cubit.person.birthday,
                      location: cubit.person.placeOfBirth,
                      department: cubit.person.department),
                  PersonBio(bio: cubit.person.biography),
                  PersonProfileImages(imagesPaths: cubit.person.images),
                  PersonMedia(media: cubit.viewMedia)
                ],
              ),
            ),
          ],
            ),
        ),
      ),
    );
  }
}
