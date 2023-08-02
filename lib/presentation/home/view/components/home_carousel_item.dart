import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/domain/models/media.dart';
import 'package:screen_scape/presentation/home/view_model/cubit.dart';

import '../../../../app/functions/functions.dart';


class HomeCarouselItem extends StatelessWidget {
  final Media movie;
  final Color color;
  final int index;
  const HomeCarouselItem({Key? key, required this.movie, required this.color, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    final image = NetworkImage(AppFunctions.getNetworkImagePath(movie.imgPath));
    return FractionallySizedBox(
      alignment: Alignment.bottomCenter,
      heightFactor: 0.96,
      child: GestureDetector(
        onTap: (){ Navigator.pushNamed(context, AppRoutes.movieDetailsRoute, arguments: movie);},
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppPadding.pagePadding,),
          child: AnimatedScale(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            scale: HomeCubit.get(context).getScale(index),
            child: Container(
              margin: const EdgeInsets.fromLTRB(p,p/2,0,p/2),
              decoration: BoxDecoration(
                  color: color,
                  image: DecorationImage(image: image, fit: BoxFit.cover, isAntiAlias: false),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: color.withOpacity(0.6),
                      blurRadius: 22, offset: const Offset(0, 2))]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
