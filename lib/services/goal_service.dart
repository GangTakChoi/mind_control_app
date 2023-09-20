import 'package:mind_control/utils/dio_client.dart';

class GoalService {
  DioClient dioClient = DioClient();

  create(String content) async {
    final data = {'content': content};
    final res = await dioClient.post('/goals', data);

    return res;
  }

  getGoalList() async {
    final res = await dioClient.get('/goals');

    return res.data;
  }
}
