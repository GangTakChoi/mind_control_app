import 'package:dio/dio.dart';

class DioClient extends Interceptor {
  static Dio dio = Dio();
  DioClient() {
    dio.options.baseUrl = 'https://mind-api.choikt.com:3000';
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
              'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.baseUrl}${err.requestOptions.path}');
          print('ERROR DATA => ${err.response?.data}');

          return handler.next(err);
        },
      ),
    );
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
