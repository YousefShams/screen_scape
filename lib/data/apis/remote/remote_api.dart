import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:screen_scape/app/constants/constants.dart';

const base = AppConstants.baseUrl;
final key = AppConstants.apiKey;

class RemoteApi {

  static late final RemoteApi _instance;

  RemoteApi._internal();

  factory RemoteApi() => _instance;

  final timeoutDuration = const Duration(seconds: 20);

  final headers = {
    "Accept" : "application/json",
    'Authorization': 'Bearer ${AppConstants.token}',
  };

  static Future init() async {
    _instance = RemoteApi._internal();
  }

  Future<http.Response> get(String path, {String query = ""}) async {
    final result = await http.get(Uri.parse("$base$path$key&$query"), headers: headers)
        .timeout(timeoutDuration, onTimeout: () { throw const SocketException("");});
    return result;
  }

  Future<List<http.Response>> getMultiple(List<String> paths, List<String> queries) async {
    final client = http.Client();
    List<http.Response> responses =  [];

    int i = 0;
    for(String path in paths) {
      final query = queries.isEmpty ? "" : queries[i];
      final uri = Uri.parse("$base$path$key&$query");
      final response = await client.get(uri, headers: headers).timeout(
          timeoutDuration, onTimeout: () { throw const SocketException("");});

      responses.add(response);
      i++;
    }

    client.close();
    return responses;
  }

  Future<http.Response> post(String path, Map data, {String query = ""}) async {
    final result = await http.post(Uri.parse("$base$path$key"), headers: headers,
        body : data).timeout(timeoutDuration, onTimeout: () { throw const SocketException("");});
    return result;
  }

}