import 'package:flutter/material.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.task_alt, size: 64),
          SizedBox(height: 16),
          Text(
            'No tienes tareas',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text('Crea tu primera tarea para comenzar.'),
        ],
      ),
    );
  }
}
