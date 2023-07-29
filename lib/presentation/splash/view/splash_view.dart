import 'package:flutter/material.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import 'package:screen_scape/presentation/splash/view_model/splash_view_model.dart';
import '../../../app/resources/app_assets.dart';
import '../../../../data/apis/local/local_api.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final splashVM = SplashViewModel(LocalApi());

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
    splashVM.init(context);
  }


}
