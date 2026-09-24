import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import '../providers/task_providers.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.description),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) {
            ref.read(taskNotifierProvider.notifier).toggleTask(task);
          },
        ),
      ),
    );
  }
}
