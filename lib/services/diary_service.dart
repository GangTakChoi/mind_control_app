import 'package:dio/dio.dart';
import 'package:mind_control/models/diary.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/utils/dio_client.dart';

class DiaryService {
  static DioClient dioClient = DioClient();

  static Future<Response> delete(String id) async {
    final res = await dioClient.delete('/diaries/$id');
    return res;
  }

  Future<Response> create(
      String content, String feelingValue, List<Goal> tasks) async {
    final goals = [];

    tasks.forEach((Goal task) {
      final goal = {'content': task.title, 'isCompleted': task.isChecked};

      goals.add(goal);
    });

    final data = {
      'content': content,
      'mindState': feelingValue,
      'goals': goals
    };

    return await dioClient.post('/diaries', data);
  }

  static Future<List<Diary>> getList() async {
    final res = await dioClient.get('/diaries');

    if (res.statusCode == 200) {
      return dairyFromJson(res.data);
    }
    return <Diary>[];
  }
}
