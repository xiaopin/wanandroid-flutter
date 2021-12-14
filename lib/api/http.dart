import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanandroid_flutter/utils/constants.dart';

Future<String> getCookieDirectoryPath() async {
  Directory dir = await getApplicationDocumentsDirectory();
  String path = dir.path;
  return "$path/.cookies/";
}

class Http {
  static final Http _instance = Http._();
  static String cookieDirectoryPath = '';
  late Dio _dio;
  late PersistCookieJar _cookieJar;

  factory Http() => _instance;

  Http._() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
    ));
    _cookieJar = PersistCookieJar(storage: FileStorage(cookieDirectoryPath));
    _dio.interceptors.add(CookieManager(_cookieJar));
    _dio.interceptors.add(ApiInterceptorsWrapper());
  }

  static Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _instance._dio
        .post(path, data: data, queryParameters: queryParameters);
  }

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _instance._dio.get(path, queryParameters: queryParameters);
  }
}

class ApiInterceptorsWrapper extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    debugPrint(
        "request info => url:${options.uri}, headers:${options.headers}");
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> json = response.data;
    var code = json["errorCode"];
    if (code == -1001) {
      // 未登录
      Http._instance._cookieJar.deleteAll();
      handler.reject(DioError(
        requestOptions: response.requestOptions,
        response: response,
      ));
      return;
    }
    if (code != 0) {
      // 接口数据返回异常
      handler.reject(DioError(
        requestOptions: response.requestOptions,
        response: response,
        error: StateError(json["errorMsg"] ?? ""),
      ));
      return;
    }
    super.onResponse(response, handler);
  }
}
