import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mind_control/utils/dio_client.dart';

class UserService {
  DioClient dioClient = DioClient();

  Future<bool> getIsValidId(String accountId) async {
    final res = await dioClient.get('/users/$accountId/verification');

    if (res.statusCode == 200) {
      return res.data['isConflict'] ? false : true;
    }

    return false;
  }

  Future<Response<dynamic>> create(Map<String, String> data) async {
    final res = await dioClient.post('/users', data);

    return res;
  }

  Future<String?> login(String username, String password) async {
    try {
      final data = {'username': username, 'password': password};
      final res = await dioClient.post('/auth/login', data);
      if (res.statusCode == 201) {
        final token = res.data['access_token'];
        final storage = FlutterSecureStorage();
        storage.write(key: 'token', value: token);

        return token;
      }
    } on DioException {
      return null;
    }
    return null;
  }
}
