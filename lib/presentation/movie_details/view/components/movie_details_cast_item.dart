import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/functions/functions.dart';
import 'package:screen_scape/app/resources/app_assets.dart';
import 'package:screen_scape/app/resources/app_colors.dart';
import 'package:screen_scape/app/resources/app_values.dart';

class MovieCreditsItem extends StatelessWidget {
  final String? imagePath;
  final String name;
  final String role;
  const MovieCreditsItem({Key? key, this.imagePath, required this.name, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const p = AppPadding.pagePadding;
    return Container(
      margin: const EdgeInsets.fromLTRB(p, p, p, p),
      width: context.getWidth()*0.33,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blueGrey,
            backgroundImage: (imagePath==null) ?
            null : Image.network(
              AppFunctions.getNetworkImagePath(imagePath!),
              fit: BoxFit.contain, isAntiAlias: true,
            ).image,
            child: (imagePath==null) ? const Icon(Icons.person, size: 70,
              color: AppColors.scaffoldDarkBackground,):null,
          ),
          const SizedBox(height:12),
          Text(name, style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 1,),
          const SizedBox(height: 7),
          Text(role, style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
