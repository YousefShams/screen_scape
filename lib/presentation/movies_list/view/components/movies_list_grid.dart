import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/media_grid_view.dart';
import 'package:screen_scape/presentation/movies_list/view_model/states.dart';
import '../../../../domain/models/media.dart';

class MoviesListGrid extends StatelessWidget {
  final List<Media> movies;
  final ScrollController controller;
  final MoviesListState state;
  const MoviesListGrid({Key? key, required this.movies, required this.controller, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaGridView(movies: movies, controller: controller, state: state,);
  }
}
