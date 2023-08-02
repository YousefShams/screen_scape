import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_styles.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import '../../../../app/resources/app_routes.dart';
import '../../../../data/paths/current_path.dart';
import '../../../../data/paths/paths.dart';
import '../../../../domain/models/movies_list_model.dart';
import '../../../../domain/models/media.dart';

class HomeTitle extends StatelessWidget {
  final String title;
  final List<Media>? media;
  const HomeTitle({Key? key, required this.title, this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(p, p, 0, p),
        child: Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  shadows: AppStyles.textSpecialShadows
              ),
            ),
            const Spacer(),
            Visibility(
              visible: media != null,
              child: IconButton(
                onPressed: () {
                  final path = "${CurrentEntity.getCurrentEntityPath().basePath}${Paths.topRatedPath}";
                  Navigator.pushNamed(context, AppRoutes.moviesListRoute,
                      arguments: MoviesListData(title, media!,path,null));
                },
                icon: const Icon(Icons.more_vert_rounded, color: AppColors.primaryColor,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
