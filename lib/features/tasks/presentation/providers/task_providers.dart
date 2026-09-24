import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/datasources/task_local_datasource.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import 'task_notifier.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final taskLocalDataSourceProvider = Provider<TaskLocalDataSource>((ref) {
  final preferences = ref.watch(sharedPreferencesProvider);

  return TaskLocalDataSource(preferences);
});

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final dataSource = ref.watch(taskLocalDataSourceProvider);

  return TaskRepositoryImpl(dataSource);
});

final taskNotifierProvider = AsyncNotifierProvider<TaskNotifier, List<Task>>(
  TaskNotifier.new,
);
