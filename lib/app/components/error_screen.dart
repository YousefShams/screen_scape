import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/app/resources/app_assets.dart';
import 'package:screen_scape/app/resources/app_routes.dart';
import 'package:screen_scape/app/resources/app_strings.dart';
import '../resources/app_values.dart';


class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({Key? key, required this.message}) : super(key: key);

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
            Lottie.asset(AppAssets.error, width: context.getWidth()/2),
            const SizedBox(height: 20),
            Text(message, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            const SizedBox(height: 40),
            FilledButton(onPressed: (){
              Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
            }, child: const Text(AppStrings.tryAgain,textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
}