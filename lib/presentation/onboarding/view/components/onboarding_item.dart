import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:screen_scape/app/extensions/screen_ext.dart';
import '../../../../app/resources/app_values.dart';
import '../../../../domain/models/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel onboardingItem;
  const OnboardingItem({Key? key, required this.onboardingItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lottie.asset(onboardingItem.imagePath, height: context.getHeight()/2),
        const SizedBox(height: AppSpacing.verticalSpaceBetweenSections),
        Text(onboardingItem.title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSpacing.verticalSpaceBetweenTitleAndText),
        Text(onboardingItem.subtitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
