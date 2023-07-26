import 'package:screen_scape/data/apis/local/local_api.dart';
import 'package:screen_scape/data/apis/remote/remote_api.dart';
import 'package:screen_scape/data/repositories/movies_repository.dart';
import '../../data/datasources/movies_datasource.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future initApp() async {
  await dotenv.load(fileName: ".env");
  await LocalApi.init();
  await RemoteApi.init();
  await MoviesDatasource.init();
  await MoviesRepository.init();
}