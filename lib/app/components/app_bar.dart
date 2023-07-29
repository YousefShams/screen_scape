import 'package:flutter/material.dart';
import '../resources/app_assets.dart';

AppBar defaultAppBar(context) {
  return AppBar(
    elevation: 0,
    leading: Navigator.canPop(context) ?
    IconButton(
      onPressed: () { Navigator.pop(context); },
      icon: Icon(Icons.arrow_back_ios_new_rounded, color: Theme.of(context).textTheme.titleLarge?.color,)
    ) : null,
    title: Image.asset(AppAssets.logo, height: 30),
  );
}