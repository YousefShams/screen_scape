import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen_scape/presentation/onboarding/view_model/states.dart';
import '../../../app/resources/app_assets.dart';
import '../../../app/resources/app_databases_keys.dart';
import '../../../app/resources/app_routes.dart';
import '../../../app/resources/app_strings.dart';
import '../../../../data/apis/local/local_api.dart';
import '../../../domain/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final LocalApi localApi;
  OnboardingCubit(this.localApi) : super(OnboardingInitialState());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  final controller = PageController();

  int currentIndex = 0;

  final onboardingData = [
    const OnboardingModel(AppAssets.onboarding1, AppStrings.onboardingTitle1, AppStrings.onboardingSubtitle1),
    const OnboardingModel(AppAssets.onboarding2, AppStrings.onboardingTitle2, AppStrings.onboardingSubtitle2),
    const OnboardingModel(AppAssets.onboarding3, AppStrings.onboardingTitle3, AppStrings.onboardingSubtitle3),
  ];


  //EVENTS
  void increment(context) {
    if(currentIndex == onboardingData.length-1) {
      localApi.save(AppDatabasesKeys.settingsDatabase, {AppDatabasesKeys.onboardingDone: true});
      Navigator.pushNamed(context, AppRoutes.homeRoute);
    }
    else {
      currentIndex = (currentIndex+1)%onboardingData.length;
      controller.animateToPage(currentIndex, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      emit(OnboardingUpdateState());
    }
  }

  void decrement() {
    currentIndex = (currentIndex-1)%onboardingData.length;
    controller.animateToPage(currentIndex, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
    emit(OnboardingUpdateState());
  }


}