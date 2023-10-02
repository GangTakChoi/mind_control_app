import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/models/task.dart';
import 'package:mind_control/constants.dart';

import '../models/diary.dart';
import '../services/goal_service.dart';

class WriteDayProvider extends ChangeNotifier {
  FeelingValue _currentFeelingValue = FeelingValue.soHappy;
  List<Goal> _task = [];
  String recordOfDay = '';

  GoalService goalService = GoalService();

  UnmodifiableListView<Goal> get tasks {
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

  void init() {
    recordOfDay = '';
    _currentFeelingValue = FeelingValue.soHappy;
    notifyListeners();
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
      Goal task = Goal(id: goalInfo['id'], title: goalInfo['content']);
      _task.add(task);
    }
    notifyListeners();
  }

  Future<void> deleteTask(Goal taskToDelete) async {
    final taskId = taskToDelete.id;
    await goalService.delete(taskId);
    _task.remove(taskToDelete);
    notifyListeners();
  }

  void toggleTaskCheckingState(Goal task) {
    task.toggleCheckingState();
    notifyListeners();
  }
}
