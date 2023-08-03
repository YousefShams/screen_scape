import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_fonts.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_values.dart';
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
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(p, p, 0, 0),
        width: 150,
        child: Column(
          children: [
            PersonImage(personImagePath: imagePath, highTopPadding: false, size: 60,),
            const SizedBox(height:12),
            Text(name, style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: AppFonts.smallerFontSize
            ),
              textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,
              maxLines: 2,),
            const SizedBox(height: 7),
            Text(role, maxLines: 2, textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.fade),
          ],
        ),
      ),
    );
  }
}
