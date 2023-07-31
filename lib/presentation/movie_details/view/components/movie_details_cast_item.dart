import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import 'package:screen_scape/data/paths/paths.dart';
import 'package:screen_scape/presentation/person/view/components/person_image.dart';

class MovieCreditsItem extends StatelessWidget {
  final String? imagePath;
  final String name;
  final String role;
  final int id;
  const MovieCreditsItem({Key? key, this.imagePath, required this.name, required this.role, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return GestureDetector(
      onTap: () { Navigator.pushNamed(context, AppRoutes.personRoute, arguments: id);},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(p, p, p, p),
        width: context.getWidth()*0.33,
        child: Column(
          children: [
            PersonImage(personImagePath: imagePath),
            const SizedBox(height:12),
            Text(name, style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1,),
            const SizedBox(height: 7),
            Text(role, style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
