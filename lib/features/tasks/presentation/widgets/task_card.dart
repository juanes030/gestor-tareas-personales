import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/task.dart';
import '../pages/task_detail_page.dart';
import '../pages/task_form_page.dart';
import '../providers/task_providers.dart';

class TaskCard extends ConsumerWidget {
  const TaskCard({required this.task, super.key});

  final Task task;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar tarea'),
          content: Text(
            '¿Estás seguro de que quieres eliminar "${task.title}"?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (shouldDelete != true) {
      return;
    }

    await ref.read(taskNotifierProvider.notifier).deleteTask(task.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: task.isCompleted ? 0.75 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: task.isCompleted
                ? Colors.grey.shade200
                : Colors.grey.shade100,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => TaskDetailPage(task: task)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CompletionButton(
                  task: task,
                  onChanged: () {
                    ref.read(taskNotifierProvider.notifier).toggleTask(task);
                  },
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: task.isCompleted ? Colors.grey.shade500 : null,
                        ),
                      ),
                      if (task.description.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          task.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: task.isCompleted
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                            height: 1.35,
                          ),
                        ),
                      ],
                      const SizedBox(height: 12),
                      _TaskStatus(isCompleted: task.isCompleted),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_horiz),
                  tooltip: 'Opciones',
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => TaskFormPage(task: task),
                          ),
                        );
                      case 'delete':
                        _confirmDelete(context, ref);
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(
                      value: 'edit',
                      child: ListTile(
                        leading: Icon(Icons.edit_outlined),
                        title: Text('Editar'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: ListTile(
                        leading: Icon(Icons.delete_outline),
                        title: Text('Eliminar'),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CompletionButton extends StatelessWidget {
  const _CompletionButton({required this.task, required this.onChanged});

  final Task task;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: task.isCompleted
              ? const Color(0xFF5B5FEF)
              : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: task.isCompleted
                ? const Color(0xFF5B5FEF)
                : Colors.grey.shade400,
            width: 2,
          ),
        ),
        child: task.isCompleted
            ? const Icon(Icons.check, size: 17, color: Colors.white)
            : null,
      ),
    );
  }
}

class _TaskStatus extends StatelessWidget {
  const _TaskStatus({required this.isCompleted});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isCompleted
        ? const Color(0xFFE8F5E9)
        : const Color(0xFFFFF4E5);

    final foregroundColor = isCompleted
        ? const Color(0xFF2E7D32)
        : const Color(0xFFB76E00);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isCompleted ? Icons.check_circle_outline : Icons.schedule_outlined,
            size: 15,
            color: foregroundColor,
          ),
          const SizedBox(width: 5),
          Text(
            isCompleted ? 'Completada' : 'Pendiente',
            style: TextStyle(
              color: foregroundColor,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
