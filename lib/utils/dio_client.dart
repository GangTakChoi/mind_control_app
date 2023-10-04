import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mind_control/screens/login_page.dart';
import 'package:mind_control/utils/app_navigator.dart';
import 'package:mind_control/utils/storage_client.dart';
import 'package:mind_control/utils/toast.dart';

import 'http_override.dart';
import 'package:flutter/material.dart';

class DioClient extends Interceptor {
  static Dio dio = Dio();
  DioClient({isDevMode = false, BuildContext? context}) {
    if (isDevMode) HttpOverrides.global = MyHttpOverrides();

    dio.options.baseUrl = isDevMode
        ? 'https://127.0.0.1:3000'
        : 'https://mind-api.choikt.com:3000';
    dio.options.connectTimeout = Duration(seconds: 10);
    dio.options.receiveTimeout = Duration(seconds: 10);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          print('===========================================');
          print(
              'REQUEST[${options.method}] => URI: ${options.baseUrl}${options.path}');
          print('REQUEST[body] => ${options.data}');

          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print(
              'RESPONSE[${response.statusCode}] => URI: ${response.requestOptions.baseUrl}${response.requestOptions.path}');

          return handler.next(response);
        },
        onError: (DioException err, ErrorInterceptorHandler handler) {
          print(
              'ERROR[${err.response?.statusCode}] => URI: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
          print('ERROR DATA => ${err.response?.data}');
          print(err);

          final errorMessage = err.response?.data['message'];

          if (errorMessage == 'TokenExpired') {
            final appNavigator = AppNavigator.instance;
            StorageClient.setIsKeepLogin(false);
            CustomToast.showToastNormalType('인증 정보가 만료되었습니다.\n다시 로그인해주세요.');
            appNavigator.removeUntil(LoginPage.id);
            return handler.next(err);
          }

          if (err.requestOptions.path != '/auth/login') {
            CustomToast.showToastNormalType(
                errorMessage ?? '오류가 발생했습니다.\n문제가 지속될 경우 앱을 재시작해주세요.');
          }

          return handler.next(err);
        },
      ),
    );
  }

  static void setToken(String token) async {
    dio.options.headers = {'Authorization': 'Bearer $token'};
  }

  static Future<Response<dynamic>> get(String path) async {
    final res = await dio.get(path);
    return res;
  }

  static Future<Response<dynamic>> post(
      String path, Map<String, dynamic> data) async {
    final res = await dio.post(path, data: data);
    return res;
  }

  static Future<Response<dynamic>> delete(String path) async {
    final res = await dio.delete(path);
    return res;
  }
}
