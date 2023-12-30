import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/blur_animated_background.dart';
import 'package:screen_scape/domain/models/movies_list_model.dart';
import 'package:screen_scape/presentation/movies_list/view/components/movies_list_cubit_widget.dart';
import 'package:screen_scape/presentation/movies_list/view/components/movies_list_grid.dart';
import 'components/movies_list_title.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesData = ModalRoute.of(context)!.settings.arguments as MoviesListData;
    return MoviesListCubitWidget(
      moviesData : moviesData,
      builder: (cubit, state) => Scaffold(
        body: Stack(
          children: [
            const BlurAnimation(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviesListTitle(title: moviesData.title),
                MoviesListGrid(movies: cubit.media,
                  controller: cubit.controller, state: state,)
              ],
            )
          ],
        )
      ),
    );
  }
}
