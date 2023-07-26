import 'package:flutter/material.dart';

import '../../../app/resources/app_values.dart';
import 'components/onboarding_buttons.dart';
import 'components/onboarding_cubit.dart';
import 'components/onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnboardingCubitWidget(
      builder: (cubit)=>
          Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.controller,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => OnboardingItem(onboardingItem: cubit.onboardingData[index]),
                    ),
                  ),
                  OnboardingButtons(cubit: cubit, onboardingLength: cubit.onboardingData.length)
                ],
              ),
            ),
          ),
    );
  }
}
