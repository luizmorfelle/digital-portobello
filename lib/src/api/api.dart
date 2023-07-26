import 'dart:convert';

import 'package:dio/dio.dart';

const baseURL = 'https://api-portobello.sensedia.com/digital-portobello/';
const clientID = '53eea8e8-7630-4cf8-96f4-1d97f8e8db91';
const authToken =
    'Basic NTNlZWE4ZTgtNzYzMC00Y2Y4LTk2ZjQtMWQ5N2Y4ZThkYjkxOjFmYTI4ZjIxLThmZGYtNGRlMC1iYWE0LTBmY2M1NGQwYTVmNg==';

ApiFactory? instace;
String? accessToken;

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    validateStatus: (_) => true,
    headers: {
      "client_id": clientID,
      "access_token": accessToken ?? "",
      "Access-Control-Allow-Origin": "*",
    },
    contentType: "application/json",
  ),
);

Future<void> refreshToken() async {
  print('refreshing token');
  Response response = await Dio().post(
    "https://api-portobello.sensedia.com/oauth/access-token",
    data: json.encode({"grant_type": "client_credentials"}),
    options: Options(
      contentType: "application/json",
      headers: {"Authorization": authToken},
    ),
  );

  accessToken = response.data["access_token"];
}

class ApiFactory {
  Future<Response> get(
      {String url = "", Map<String, dynamic>? queryParameters}) async {
    print('GET: $baseURL$url');

    try {
      final response = await dio.get(
        url,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 400 || response.statusCode == 401) {
        refreshToken();
        get(
          url: url,
          queryParameters: queryParameters,
        );
      }
      return response;
    } on DioException catch (e) {
      print(
          '[Dio Helper - GET] Connection Exception => ${e.message!} - ${e.response} - ${e.requestOptions.headers}');
      rethrow;
    }
  }

  Future<Response> post(
      {String url = "",
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameters}) async {
    try {
      print('POST: $baseURL$url');
      final response = await dio.post(
        url,
        data: json.encode(body),
        queryParameters: queryParameters,
      );
      if (response.statusCode != 200) {
        refreshToken();
        post(
          url: url,
          body: body,
          queryParameters: queryParameters,
        );
      }
      return response;
    } on DioException catch (e) {
      print('[Dio Helper - GET] Connection Exception => ${e.message!}');
      rethrow;
    }
  }
}

ApiFactory get api {
  return instace ??= ApiFactory();
}
