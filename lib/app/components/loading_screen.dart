import 'package:flutter/material.dart';
import 'package:screen_scape/app/resources/app_colors.dart';


class LoadingScreen extends StatelessWidget {

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor,),
      ),
    );
  }
}