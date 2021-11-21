import 'package:dio/dio.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

final dio = Dio(BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 30000,
));

class Http {
  static Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return dio.post(path, data: data, queryParameters: queryParameters);
  }

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return dio.get(path, queryParameters: queryParameters);
  }
}
