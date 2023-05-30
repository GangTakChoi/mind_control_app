import 'package:flutter/material.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/models/feeling_emotion.dart';

class DayRecordBundle {
  List<Task> tasks;
  String? recordOfDay;
  String date;
  FeelingValue feelingValue;
  bool isExpand = false;
  static const double iconSize = 40;

  DayRecordBundle(
      {required this.tasks,
      this.recordOfDay,
      required this.date,
      required this.feelingValue});

  int get taskCount {
    return tasks.length;
  }

  List<String> getCompleteGoalList() {
    final List<String> completeGoalList = [];

    for (Task task in tasks) {
      if (task.isChecked) {
        completeGoalList.add(task.title);
      }
    }

    return completeGoalList;
  }

  Icon getIconForFeelingValue() {
    if (feelingValue == FeelingValue.soHappy) {
      return Icon(
        Icons.north,
        color: Color(0xff1E33F1),
        size: iconSize,
      );
    } else if (feelingValue == FeelingValue.littleBitHappy) {
      return Icon(
        Icons.north_east,
        color: Color(0xff717EF6),
        size: iconSize,
      );
    } else if (feelingValue == FeelingValue.common) {
      return Icon(
        Icons.east,
        color: Color(0xff47D65E),
        size: iconSize,
      );
    } else if (feelingValue == FeelingValue.littleBitUnHappy) {
      return Icon(
        Icons.south_east,
        color: Color(0xffFC7777),
        size: iconSize,
      );
    } else if (feelingValue == FeelingValue.soUnHappy) {
      return Icon(
        Icons.south,
        color: Color(0xffF91111),
        size: iconSize,
      );
    } else {
      return Icon(
        Icons.question_mark,
        color: Color(0xff000000),
        size: iconSize,
      );
    }
  }
}
