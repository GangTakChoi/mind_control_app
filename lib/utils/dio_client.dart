import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioClient extends Interceptor {
  static Dio dio = Dio();
  DioClient({baseUrl = 'http://localhost:3000'}) {
    if (dio.options.baseUrl.isNotEmpty) return;

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          print(
              'REQUEST[${options.method}] => URI: ${options.baseUrl}${options.path}');

          final token = await FlutterSecureStorage().read(key: 'token');
          if (token != null) {
            options.headers = {'Authorization': 'Bearer $token'};
          }

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
  Future<Response<dynamic>> get(String path) async {
    final res = await dio.get(path);
    return res;
  }

  Future<Response<dynamic>> post(String path, Map<String, dynamic> data) async {
    final res = await dio.post(path, data: data);
    return res;
  }
}
