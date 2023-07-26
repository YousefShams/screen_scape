import 'package:flutter/material.dart';
import 'package:screen_scape/app/services/init.dart';
import 'app/application/app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initApp();

  runApp(const App());
}
