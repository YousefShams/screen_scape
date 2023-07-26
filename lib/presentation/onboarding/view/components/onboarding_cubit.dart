import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/apis/local/local_api.dart';
import '../../view_model/cubit.dart';
import '../../view_model/states.dart';

class OnboardingCubitWidget extends StatelessWidget {
  final Function(OnboardingCubit cubit) builder;
  const OnboardingCubitWidget({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(LocalApi()),
      child: BlocBuilder<OnboardingCubit,OnboardingState>(
          builder: (context, state) =>
              builder(OnboardingCubit.get(context))
      ),
    );
  }
}
