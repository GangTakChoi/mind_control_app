import 'package:flutter/material.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/constants.dart';
import 'package:intl/intl.dart';

import 'dart:convert';

List<Diary> dairyFromJson(dynamic data) =>
    List<Diary>.from(data.map((x) => Diary.fromJson(x)));

String dairyToJson(List<Diary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diary {
  String id;
  List<Goal> tasks;
  String content;
  String date;
  String mindState;
  bool isExpand = false;
  static const double iconSize = 40;

  Diary(
      {required this.id,
      required this.tasks,
      required this.content,
      required this.date,
      required this.mindState});

  factory Diary.fromJson(Map<String, dynamic> json) {
    String date =
        DateFormat("yyyy년 MM월 dd일").format(DateTime.parse(json['createdAt']));
    return Diary(
      id: json["id"],
      content: json["content"],
      mindState: json['mindState'],
      date: date,
      tasks: List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content,
        "mindState": mindState,
        "date": date,
        "goals": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };

  // =========================================

  int get taskCount {
    return tasks.length;
  }

  List<String> getCompleteGoalList() {
    final List<String> completeGoalList = [];

    for (Goal task in tasks) {
      if (task.isChecked) {
        completeGoalList.add(task.title);
      }
    }

    return completeGoalList;
  }

  Icon getIconForFeelingValue() {
    if (mindState == soHappy) {
      return Icon(
        Icons.north,
        color: Color(0xff1E33F1),
        size: iconSize,
      );
    } else if (mindState == littleBitHappy) {
      return Icon(
        Icons.north_east,
        color: Color(0xff717EF6),
        size: iconSize,
      );
    } else if (mindState == common) {
      return Icon(
        Icons.east,
        color: Color(0xff47D65E),
        size: iconSize,
      );
    } else if (mindState == littleBitUnHappy) {
      return Icon(
        Icons.south_east,
        color: Color(0xffFC7777),
        size: iconSize,
      );
    } else if (mindState == soUnHappy) {
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
