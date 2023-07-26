import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/resources/app_colors.dart';
import '../../view_model/cubit.dart';

class OnboardingButtons extends StatelessWidget {
  final OnboardingCubit cubit;
  final int onboardingLength;
  const OnboardingButtons({Key? key, required this.cubit, required this.onboardingLength}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: cubit.decrement, icon: Icon(Icons.arrow_back_ios_rounded,color: Theme.of(context).textTheme.titleLarge!.color), iconSize: 30),
        SmoothPageIndicator(
          effect: const ExpandingDotsEffect(activeDotColor: AppColors.primaryColor),
          controller: cubit.controller, count: onboardingLength,
        ),
        IconButton(onPressed: (){ cubit.increment(context); }, icon: Icon(Icons.arrow_forward_ios_rounded, color: Theme.of(context).textTheme.titleLarge!.color,), iconSize: 30),
      ],
    );
  }
}
