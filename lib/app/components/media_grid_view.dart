import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/presentation/movies_list/view/components/movies_list_item.dart';
import '../../../../domain/models/media.dart';
import '../../presentation/movies_list/view_model/states.dart';

class MediaGridView extends StatelessWidget {
  final List<Media> movies;
  final Function? onAfterPopping;
  final ScrollController? controller;
  final MoviesListState? state;
  final bool expanded;

  const MediaGridView({Key? key, required this.movies, this.onAfterPopping,
    this.controller, this.state, this.expanded = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    final stack = Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(p,0,p,0),
          child: GridView.builder(
            controller: controller,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20 , crossAxisSpacing: 15,
                childAspectRatio: 1.5/3
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(bottom: p),
                  child: MoviesListItem(movie: movies[index], onAfterPopping: onAfterPopping,
                  ));
            },
          ),
        ),
        state is MoviesListLoading ? const LinearProgressIndicator(
          minHeight: 5,
          color: AppColors.primaryColor,) : const SizedBox.shrink()
      ],
    );
    return (expanded) ? Expanded(
      child: stack,
    ) : stack;
  }
}
