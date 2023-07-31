import 'package:flutter/material.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/presentation/person/view/components/person_bio.dart';
import 'package:screen_scape/presentation/person/view/components/person_cubit_widget.dart';
import 'package:screen_scape/presentation/person/view/components/person_image.dart';
import 'package:screen_scape/presentation/person/view/components/person_info.dart';
import 'package:screen_scape/presentation/person/view/components/person_media.dart';
import 'package:screen_scape/presentation/person/view/components/person_profile_images.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    return PersonCubitWidget(
      id: id,
      builder: (cubit) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: PersonImage(
                  size: 80,
                  personImagePath: AppFunctions.getNetworkImagePath(cubit.person.imagePath))),
                Center(child: PersonInfo(name: cubit.person.name, department: cubit.person.department)),
                PersonBio(bio: cubit.person.biography),
                PersonProfileImages(imagesPaths: cubit.person.images),
                PersonMedia(media: [...cubit.person.credits.cast, ...cubit.person.credits.crew])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
