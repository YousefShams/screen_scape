import 'package:flutter/material.dart';
import '../../presentation/onboarding/view/onboarding_view.dart';
import '../../presentation/splash/view/splash_view.dart';
import '../transition/page_transition.dart';

class AppRoutes {

  static const splashRoute = "/splash";
  static const onboardingRoute = "/onboarding";
  static const homeRoute = "/home";


  static final screens = {
    splashRoute : const SplashScreen(),
    onboardingRoute : const OnboardingScreen(),
  };

  static Widget getScreenFromRoute(String? route) {
    return screens[route] ?? const Scaffold();
  }

  static Route onGenerateRoute (RouteSettings route) {
    return PageTransition(getScreenFromRoute(route.name), setting: route);
  }

}