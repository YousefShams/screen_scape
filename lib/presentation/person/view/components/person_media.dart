import 'package:flutter/material.dart';
import 'package:screen_scape/presentation/home/view/components/home_movies_list.dart';
import '../../../../domain/models/media.dart';


class PersonMedia extends StatelessWidget {
  final List<Media> media;
  const PersonMedia({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeMoviesList(movies: media);
  }
}
