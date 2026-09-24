import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_tareas_personales/features/tasks/presentation/pages/task_form_page.dart';
import 'package:gestor_tareas_personales/features/tasks/presentation/widgets/empty_tasks.dart';
import 'package:gestor_tareas_personales/features/tasks/presentation/widgets/task_card.dart';

import '../providers/task_providers.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksAsync = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mis tareas')),
      body: tasksAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (tasks) {
          if (tasks.isEmpty) {
            return const EmptyTasks();
          }

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];

              return TaskCard(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const TaskFormPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
