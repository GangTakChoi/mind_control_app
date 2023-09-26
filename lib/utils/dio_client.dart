import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:oktoast/oktoast.dart';

class DioClient extends Interceptor {
  static Dio dio = Dio();
  DioClient({baseUrl = 'https://mind-api.choikt.com:3000'}) {
    if (dio.options.baseUrl.isNotEmpty) return;

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          print('===========================================');
          print(
              'REQUEST[${options.method}] => URI: ${options.baseUrl}${options.path}');
          print('REQUEST[body] => ${options.data}');

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

          if (err.response?.statusCode == 401 &&
              err.requestOptions.path == '/auth/login') {
            return handler.next(err);
          }

          showToast('오류가 발생하였습니다.\n문제가 지속될 경우 앱을 재시동해주세요.',
              position: ToastPosition.bottom);

          return handler.next(err);
        },
      ),
    );
  }
  Future<Response<dynamic>> get(String path) async {
    final res = await dio.get(path);
    return res;
  }

  Future<dynamic> post(String path, Map<String, dynamic> data) async {
    try {
      final res = await dio.post(path, data: data);
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future<Response<dynamic>> delete(String path) async {
    final res = await dio.delete(path);
    return res;
  }
}
