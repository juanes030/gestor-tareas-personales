import 'package:gestor_tareas_personales/features/tasks/data/datasources/task_local_datasource.dart';
import 'package:gestor_tareas_personales/features/tasks/data/models/task_model.dart';
import 'package:gestor_tareas_personales/features/tasks/domain/entities/task.dart';
import 'package:gestor_tareas_personales/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRepositoryImpl(this._localDataSource);

  final TaskLocalDataSource _localDataSource;

  @override
  Future<List<Task>> getTasks() async {
    return _localDataSource.getTasks();
  }

  @override
  Future<void> createTask(Task task) async {
    final tasks = await _localDataSource.getTasks();

    final taskModel = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );

    tasks.add(taskModel);

    await _localDataSource.saveTasks(tasks);
  }

  @override
  Future<void> updateTask(Task task) async {
    final tasks = await _localDataSource.getTasks();

    final index = tasks.indexWhere(
      (existingTask) => existingTask.id == task.id,
    );

    if (index == -1) {
      throw Exception('Task not found');
    }

    tasks[index] = TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );

    await _localDataSource.saveTasks(tasks);
  }

  @override
  Future<void> deleteTask(String id) async {
    final tasks = await _localDataSource.getTasks();

    tasks.removeWhere((task) => task.id == id);

    await _localDataSource.saveTasks(tasks);
  }
}
