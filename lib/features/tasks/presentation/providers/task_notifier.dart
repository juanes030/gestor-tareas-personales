import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import 'task_providers.dart';

class TaskNotifier extends AsyncNotifier<List<Task>> {
  late final TaskRepository _repository;

  @override
  Future<List<Task>> build() async {
    _repository = ref.watch(taskRepositoryProvider);

    return _repository.getTasks();
  }

  Future<void> createTask({
    required String title,
    required String description,
  }) async {
    final now = DateTime.now();

    final task = Task(
      id: now.microsecondsSinceEpoch.toString(),
      title: title,
      description: description,
      isCompleted: false,
      createdAt: now,
      updatedAt: now,
    );

    await _repository.createTask(task);

    state = AsyncData(await _repository.getTasks());
  }

  Future<void> updateTask({
    required String id,
    required String title,
    required String description,
  }) async {
    final tasks = await _repository.getTasks();

    final currentTask = tasks.firstWhere((task) => task.id == id);

    final updatedTask = currentTask.copyWith(
      title: title,
      description: description,
      updatedAt: DateTime.now(),
    );

    await _repository.updateTask(updatedTask);

    state = AsyncData(await _repository.getTasks());
  }

  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);

    state = AsyncData(await _repository.getTasks());
  }

  Future<void> toggleTask(Task task) async {
    final updatedTask = task.copyWith(
      isCompleted: !task.isCompleted,
      updatedAt: DateTime.now(),
    );

    await _repository.updateTask(updatedTask);

    state = AsyncData(await _repository.getTasks());
  }
}
