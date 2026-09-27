import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task? task;
  const TaskDetailsScreen({super.key, this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Details for: ${task?.title ?? "Unknown"}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}
