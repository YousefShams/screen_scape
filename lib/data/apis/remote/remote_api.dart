import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:screen_scape/app/constants/constants.dart';

const base = AppConstants.baseUrl;
final key = AppConstants.apiKey;

class RemoteApi {

  static late final RemoteApi _instance;

  RemoteApi._internal();

  factory RemoteApi() => _instance;

  final timeoutDuration = const Duration(seconds: 30);

  final headers = {
    "Accept" : "application/json",
    'Authorization': 'Bearer ${AppConstants.token}',
  };

  static Future init() async {
    _instance = RemoteApi._internal();
  }

  Future<http.Response> get(String path, {String query = ""}) async {
    final result = await http.get(Uri.parse("$base$path$key$query"), headers: headers)
        .timeout(timeoutDuration, onTimeout: () { throw const SocketException("");});
    return result;
  }

  Future<http.Response> post(String path, Map data, {String query = ""}) async {
    final result = await http.post(Uri.parse("$base$path$key"), headers: headers,
        body : data).timeout(timeoutDuration, onTimeout: () { throw const SocketException("");});
    return result;
  }

}