import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  const TaskDetailsScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                Text(task.description),

                const SizedBox(height: 20),

                Chip(
                  label: Text(task.priority),
                ),

                const SizedBox(height: 20),

                Text(
                  "Due Date: ${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}",
                ),

                const SizedBox(height: 20),

                Text(
                  task.isCompleted ? "Completed" : "Pending",
                  style: TextStyle(
                    color: task.isCompleted ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}