import 'dart:convert';

import 'package:dio/dio.dart';

const baseURL = String.fromEnvironment("BASE_URL",
    defaultValue: "https://digitalapi.portobello.com.br/api");
final Dio dio = Dio(BaseOptions(
    baseUrl: baseURL,
    headers: {"Access-Control-Allow-Origin": "*"},
    contentType: "application/json"));

class Api {
  static Future<Response> get(
      {String url = "", Map<String, dynamic>? queryParameters}) {
    try {
      return dio.get(url, queryParameters: queryParameters, options: Options());
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future<Response> post(
      {String url = "",
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) {
    return dio.post(url,
        data: json.encode(body), queryParameters: queryParameters);
  }
}
