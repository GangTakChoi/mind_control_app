import 'package:dio/dio.dart';
import 'package:mind_control/utils/dio_client.dart';
import 'package:mind_control/utils/storage_client.dart';

class UserService {
  Future<bool> getIsValidId(String accountId) async {
    final res = await DioClient.get('/users/$accountId/verification');

    if (res.statusCode == 200) {
      return res.data['isConflict'] ? false : true;
    }

    return false;
  }

  Future<Response<dynamic>> create(Map<String, String> data) async {
    final res = await DioClient.post('/users', data);

    return res;
  }

  Future<String?> login(String username, String password) async {
    try {
      final data = {'username': username, 'password': password};
      final res = await DioClient.post('/auth/login', data);
      if (res.statusCode == 201) {
        final token = res.data['access_token'];
        StorageClient.setToken(token);
        DioClient.dio.options.headers = {'Authorization': 'Bearer $token'};

        return token;
      }
    } on DioException {
      return null;
    }
    return null;
  }

  Future<bool> delete() async {
    final res = await DioClient.delete('/users/me');

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
