import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:provider/provider.dart';
import 'package:mind_control/models/task.dart';

import '../services/goal_service.dart';

class WriteDayProvider extends ChangeNotifier {
  FeelingValue _currentFeelingValue = FeelingValue.soHappy;
  List<Task> _task = [];
  String recordOfDay = '';

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_task);
  }

  int get taskCount {
    return _task.length;
  }

  FeelingValue get currentfeelingValue {
    return _currentFeelingValue;
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
    GoalService goalService = GoalService();
    final goalList = await goalService.getGoalList();
    for (dynamic goalInfo in goalList) {
      Task task = Task(id: goalInfo['id'], title: goalInfo['content']);
      _task.add(task);
    }
    print('setTasks');
    notifyListeners();
  }

  void deleteTask(Task taskToDelete) {
    _task.remove(taskToDelete);
    notifyListeners();
  }

  void toggleTaskCheckingState(Task task) {
    task.toggleCheckingState();
    notifyListeners();
  }
}
