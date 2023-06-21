import 'dart:convert';

import 'package:dio/dio.dart';

const baseURL = String.fromEnvironment("BASE_URL",
    defaultValue: "https://digitalapi.portobello.com.br/api");
const clientID = String.fromEnvironment("CLIENT_ID");
const authToken = String.fromEnvironment("AUTH");

String? accessToken;

final Dio dio = Dio(BaseOptions(
    baseUrl: baseURL,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "client_id": clientID,
      "access_token": accessToken
    },
    contentType: "application/json"));

class Api {
  static Future<Response> get(
      {String url = "", Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.get(url, queryParameters: queryParameters);

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      refreshToken();
      return get(url: url, queryParameters: queryParameters);
    } else {
      throw DioException(
          response: response,
          requestOptions:
              RequestOptions(path: url, queryParameters: queryParameters));
    }
  }

  static Future<Response> post(
      {String url = "",
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    Response response = await dio.post(url,
        data: json.encode(body), queryParameters: queryParameters);

    if (response.statusCode == 200) {
      return response;
    } else if (response.statusCode == 401) {
      refreshToken();
      return get(url: url, queryParameters: queryParameters);
    } else {
      throw DioException(
          response: response,
          requestOptions:
              RequestOptions(path: url, queryParameters: queryParameters));
    }
  }

  static void refreshToken() {
    Dio().post("https://api-portobello.sensedia.com/oauth/access-token",
        data: json.encode({"grant_type": "client_credentials"}),
        queryParameters: {
          "Authorization": authToken
        }).then((value) => {accessToken = value.data.access_token});
  }
}
