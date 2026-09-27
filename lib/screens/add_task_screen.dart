import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../services/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<TaskProvider>().addTask(
              Task(
                id: DateTime.now().toString(),
                title: 'New Mock Task',
                description: 'Mock Description',
                priority: 'Low',
                dueDate: 'Today',
              ),
            );
            Navigator.pop(context);
          },
          child: const Text('Save Mock Task'),
        ),
      ),
    );
  }
}
