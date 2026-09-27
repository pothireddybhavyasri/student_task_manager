import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../services/task_provider.dart';
import '../screens/task_details_screen.dart';
import 'priority_chip.dart';
import 'status_chip.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(task: task),
          ),
        );
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: task.isCompleted ? 0.6 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: task.isCompleted ? Colors.grey.shade100 : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: task.isCompleted ? 1.0 : 4.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<TaskProvider>().toggleTaskCompletion(task.id);
                          },
                          child: Icon(
                            task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                            color: task.isCompleted ? Colors.green : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            task.title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                            ),
                          ),
                        ),
                        StatusChip(isCompleted: task.isCompleted),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(task.description),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                              const SizedBox(width: 4),
                              Flexible(child: Text(task.dueDate, overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        PriorityChip(priority: task.priority),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: Image.memory(
                    base64Decode('iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII='),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    context.read<TaskProvider>().deleteTask(task.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
