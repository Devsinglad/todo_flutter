import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo_flutter/models/taskModel.dart';

class TaskData extends ChangeNotifier {
  final _tasks = <TaskModel>[];

  UnmodifiableListView<TaskModel> get tasks => UnmodifiableListView(_tasks);

  int get taskcount {
    return _tasks.length;
  }

  void addtask(String newTaskTile) {
    final task = TaskModel(isDone: false, name: newTaskTile);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(TaskModel task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(TaskModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
