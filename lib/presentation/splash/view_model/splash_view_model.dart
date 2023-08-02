// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:screen_scape/app/constants/constants.dart';
import '../../../app/resources/app_databases_keys.dart';
import '../../../app/resources/app_routes.dart';
import '../../../data/apis/local/local_api.dart';


class SplashViewModel {

  final LocalApi localApi;
  const SplashViewModel(this.localApi);

  void init(context) {
    final isNotDone = _isOnboardingNotDone(localApi);
    final initialRoute = _getInitialRoute(isNotDone);
    _navigate(context, initialRoute);
  }

  bool _isOnboardingNotDone(LocalApi localApi) {
    return localApi.get(AppDatabasesKeys.settingsDatabase, AppDatabasesKeys.onboardingDone) != true;
  }

  String _getInitialRoute(bool notDone) {
    if(notDone) return AppRoutes.onboardingRoute;
    else return AppRoutes.countryRoute;
  }

  void _navigate(context, initialRoute) {
    Future.delayed(const Duration(seconds: AppConstants.splashTime), (){
      Navigator.pushReplacementNamed(context, initialRoute);
    });
  }

}