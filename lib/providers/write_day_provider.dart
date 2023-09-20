import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/constants.dart';

import '../services/goal_service.dart';

class WriteDayProvider extends ChangeNotifier {
  FeelingValue _currentFeelingValue = FeelingValue.soHappy;
  List<Task> _task = [];
  String recordOfDay = '';

  GoalService goalService = GoalService();

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_task);
  }

  int get taskCount {
    return _task.length;
  }

  FeelingValue get currentfeelingValue {
    return _currentFeelingValue;
  }

  String getFeelingWithString() {
    switch (_currentFeelingValue) {
      case FeelingValue.soHappy:
        return soHappy;
      case FeelingValue.littleBitHappy:
        return littleBitHappy;
      case FeelingValue.common:
        return common;
      case FeelingValue.littleBitUnHappy:
        return littleBitUnHappy;
      case FeelingValue.soUnHappy:
        return soUnHappy;
    }
  }

  void updateFeelingValue(FeelingValue changedFeelingValue) {
    _currentFeelingValue = changedFeelingValue;
    notifyListeners();
  }

  void refreshTasks() {
    _task.clear();
  }

  void setTasks() async {
    refreshTasks();
    final goalList = await goalService.getGoalList();
    for (dynamic goalInfo in goalList) {
      Task task = Task(id: goalInfo['id'], title: goalInfo['content']);
      _task.add(task);
    }
    notifyListeners();
  }

  void deleteTask(Task taskToDelete) async {
    final taskId = taskToDelete.id;
    await goalService.delete(taskId);
    _task.remove(taskToDelete);
    notifyListeners();
  }

  void toggleTaskCheckingState(Task task) {
    task.toggleCheckingState();
    notifyListeners();
  }
}
