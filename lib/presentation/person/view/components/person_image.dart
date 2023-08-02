import 'package:flutter/material.dart';
import 'package:screen_scape/app/components/network_image.dart';
import 'package:screen_scape/app/resources/app_values.dart';
import '../../../../app/resources/app_colors.dart';

class PersonImage extends StatelessWidget {
  final String? personImagePath;
  final double size;
  final bool highTopPadding;
  final bool noPadding;
  const PersonImage({Key? key, required this.personImagePath, this.size = 50,
    this.highTopPadding = true, this.noPadding = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: (noPadding) ? EdgeInsets.zero :
        EdgeInsets.only(top: (highTopPadding)? kToolbarHeight : AppPadding.pagePadding),

        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: size,
              backgroundColor: Colors.blueGrey,
              backgroundImage: (personImagePath==null) ?
              null : defaultNetworkImage(personImagePath).image,
              child: (personImagePath==null) ? Icon(Icons.person, size: size*7/5,
                color: AppColors.scaffoldDarkBackground,):null,
            )
          ],
        ),
      ),
    );
  }
}
