import 'package:mind_control/utils/dio_client.dart';

class GoalService {
  create(String content) async {
    final data = {'content': content};
    final res = await DioClient.post('/goals', data);

    return res;
  }

  getGoalList() async {
    final res = await DioClient.get('/goals');

    return res.data;
  }

  delete(String id) async {
    final res = await DioClient.delete('/goals/$id');
    return res;
  }
}
