import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/network_image.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/app/transition/page_transition.dart';
import 'package:screen_scape/presentation/movie_details/view/components/movie_fullscreen_image.dart';

class MovieDetailsImages extends StatelessWidget {
  final List<String> imagesPaths;
  const MovieDetailsImages({Key? key, required this.imagesPaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Visibility(
      visible: imagesPaths.isNotEmpty,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: imagesPaths.length,
            itemBuilder: (context, index) {
              final imageNetworkPath = AppFunctions.getNetworkImagePath(imagesPaths[index]);
              return Padding(
                padding: const EdgeInsets.fromLTRB(p,p,0,p),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, PageTransition(
                            MovieFullScreenImage(imagePath:imagesPaths[index])));
                      },
                      child: defaultNetworkImage(imageNetworkPath, cover: true),
                    ),
                  ),
                ),
              );
            }

        ),
      ),
    );
  }
}
