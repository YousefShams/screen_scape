import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_assets.dart';
import '../resources/app_values.dart';


class InfoScreen extends StatelessWidget {
  final String appAsset;
  final String message;
  const InfoScreen({Key? key, required this.message, required this.appAsset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(appAsset, width: context.getWidth()/1.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:AppPadding.pagePadding),
                child: Text(message, textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium))
          ],
        ),
      ),
    );
  }
}