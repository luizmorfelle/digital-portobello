import 'dart:convert';

import 'package:dio/dio.dart';

const baseURL = String.fromEnvironment("BASE_URL",
    defaultValue:
        "https://lb-pbg-app-408389648.us-east-1.elb.amazonaws.com/api");
final Dio dio = Dio();

class Api {
  static Future<Response> get(
      {String url = "", Map<String, dynamic>? queryParameters}) {
    // print("$baseURL$url");
    // print("$queryParameters");
    return dio.get("$baseURL$url", queryParameters: queryParameters);
  }

  static Future<Response> post({String url = "", Map<String, dynamic>? body}) {
    print(json.encode(body));
    return dio.post("$baseURL$url", data: json.encode(body));
  }
}
