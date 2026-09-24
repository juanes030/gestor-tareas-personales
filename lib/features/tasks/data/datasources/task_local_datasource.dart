import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class TaskLocalDataSource {
  TaskLocalDataSource(this._preferences);

  final SharedPreferences _preferences;

  static const String _tasksKey = 'tasks';

  Future<List<TaskModel>> getTasks() async {
    final tasksJson = _preferences.getStringList(_tasksKey);

    if (tasksJson == null) {
      return [];
    }

    return tasksJson
        .map(
          (taskJson) =>
              TaskModel.fromJson(jsonDecode(taskJson) as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final tasksJson = tasks.map((task) => jsonEncode(task.toJson())).toList();

    await _preferences.setStringList(_tasksKey, tasksJson);
  }
}
