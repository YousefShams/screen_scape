import 'package:hive_flutter/adapters.dart';
import '../../../app/resources/app_databases_keys.dart';


class LocalApi {

  LocalApi._internal();

  static final _instance =  LocalApi._internal();

  factory LocalApi() => _instance;

  static Map<String,Box> databases = {};

  static Future init() async {
    await Hive.initFlutter();
    databases[AppDatabasesKeys.settingsDatabase] = await Hive.openBox(AppDatabasesKeys.settingsDatabase);
    databases[AppDatabasesKeys.watchlistDatabase] = await Hive.openBox(AppDatabasesKeys.watchlistDatabase);
    //databases[AppDatabasesKeys.settingsDatabase]?.clear();
  }

  dynamic get(String dbName, String id) {
    return databases[dbName]?.get(id);
  }

  dynamic getAll(String dbName) {
    return databases[dbName]?.values.toList();
  }

  Future save(String dbName, Map<String,dynamic> value) async {
    databases[dbName]!.putAll(value);
  }

  void delete(String dbName, String id) {
    databases[dbName]!.delete(id);
  }

}