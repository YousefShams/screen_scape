import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import '../../../app/resources/app_assets.dart';
import '../../../app/resources/app_databases_keys.dart';
import '../../../app/resources/app_routes.dart';
import '../../../../data/apis/local/local_api.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 1),
            builder: (context, value, _) =>
                AnimatedOpacity(
                  opacity: value,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(AppAssets.logo, width: context.getWidth()/2,),
                )
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final initialRoute = isOnboardingDone(LocalApi()) != true ? AppRoutes.onboardingRoute : AppRoutes.homeRoute;
    Future.delayed(const Duration(seconds: 4), (){Navigator.pushReplacementNamed(context, initialRoute);});
  }

  bool? isOnboardingDone(LocalApi localApi) {
    return localApi.get(AppDatabasesKeys.settingsDatabase, AppDatabasesKeys.onboardingDone);
  }
}
