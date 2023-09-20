import 'package:dio/dio.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/utils/dio_client.dart';

import '../models/feeling_emotion.dart';

class DailyService {
  DioClient dioClient = DioClient();

  Future<Response> create(
      String content, String feelingValue, List<Task> tasks) async {
    final goals = [];

    tasks.forEach((Task task) {
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
}
