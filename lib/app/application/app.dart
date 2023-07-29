import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../resources/app_routes.dart';
import '../resources/app_themes.dart';
import '../transition/page_transition.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: AppThemes.getTheme(),
      darkTheme: AppThemes.getDarkTheme(),
      themeMode: ThemeMode.dark,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      onGenerateInitialRoutes: (_)=> [PageTransition(AppRoutes.getScreenFromRoute(AppRoutes.splashRoute))]
    );
  }
}
