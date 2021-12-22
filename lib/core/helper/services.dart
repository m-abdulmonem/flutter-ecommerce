import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

import 'authentication.dart';


class Services{
  final String baseUrl = "http://10.0.2.2:8000/api";
  final storage = GetStorage();
  final dio = Dio();

  final dioOptions = Options(contentType: Headers.jsonContentType, headers: {
    'Accept': Headers.jsonContentType,
    'Content-Type': Headers.jsonContentType,
  });


  Options get dioOptionsWithToken {
    return Options(headers: {
      'Accept': "application/json",
      'Content-Type': Headers.jsonContentType,
      'Authorization':
          "Bearer ${GetStorage().read(auth.token)}",
      'Charset': 'utf-8'
    });
  }

  Future<Response> get(String url, {String? logTitle}) async {
    Response? response;
    try {
      response = await dio.get("$baseUrl/$url", options: dioOptionsWithToken);

      return response;
    } on DioError catch (e, stacktrace) {
      log(logTitle, e, stacktrace);
      return e.response!;
    }
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? data,
      String? logTitle,
      bool auth = false,
      errorModel}) async {
    Response? response;
    try {
      response = await dio.post("$baseUrl/$url",
          data: data != null ? json.encode(data, toEncodable: myEncode) : null,
          options: auth ? dioOptions : dioOptionsWithToken);
      if (errorModel != null) handleError(response, errorModel);
      return response;
    } on DioError catch (e, stacktrace) {
      log(logTitle, e, stacktrace);

      return e.response!;
    }
  }

  Future<Response> put(String url,
      {Map<String, dynamic>? data,
      String? logTitle,
      bool auth = false,
      errorModel}) async {
    Response? response;
    try {
      response = await dio.put("$baseUrl/$url",
          data: data != null ? json.encode(data, toEncodable: myEncode) : null,
          options: dioOptionsWithToken);

      if (errorModel != null) handleError(response, errorModel);

      return response;
    } on DioError catch (e, stacktrace) {
      log(logTitle, e, stacktrace);
      return e.response!;
    }
  }

  Future<Response> del(String url,
      {Map<String, dynamic>? data, String? logTitle, errorModel}) async {
    Response? response;
    try {
      response = await dio.delete("$baseUrl/$url",
          data: data != null ? json.encode(data, toEncodable: myEncode) : null,
          options: dioOptionsWithToken);

      if (errorModel != null) handleError(response, errorModel);

      return response;
    } on DioError catch (e, stacktrace) {
      log(logTitle, e, stacktrace);
      return e.response!;
    }
  }

  log(title, e, StackTrace? stackTrace) {
    // if (e?.response?.statusCode == 401) auth.logout();

    print(
        "$title status code : ${e.response?.statusCode}. \n $title error message : ${e.message}. \n $title response : ${e.response}.");
  }

  handleError(response, model) {
    if (response.statusCode == 422) model.fromJson(response);
  }

  dynamic myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }
}
