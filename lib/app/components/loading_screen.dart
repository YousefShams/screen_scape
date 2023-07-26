import 'package:flutter/material.dart';
import '../resources/app_values.dart';


class LoadingScreen extends StatelessWidget {

  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.pagePadding),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}