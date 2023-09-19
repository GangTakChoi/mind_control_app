import 'package:mind_control/utils/dio_client.dart';

class UserService {
  DioClient dioClient = DioClient();

  Future<bool> getIsDuplicatedId(String accountId) async {
    final data = {'accountId': accountId};
    final res = await dioClient.post('users/checking-id', data);

    if (res?.statusCode == 200) {
      return res?.data?.isConflict ? true : false;
    }

    return false;
  }

  create() {}
}
