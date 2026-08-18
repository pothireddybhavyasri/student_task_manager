import 'package:flutter/material.dart';

import '../models/task.dart';
import '../screens/edit_task_screen.dart';
import '../screens/task_details_screen.dart';
import '../services/task_service.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Color priorityColor() {
    switch (widget.task.priority) {
      case "High":
        return Colors.red;
      case "Medium":
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: widget.task.isCompleted,
          onChanged: (value) async {
            setState(() {
              widget.task.isCompleted = value!;
            });

            await TaskService.saveTasks();
          },
        ),

        title: Text(
          widget.task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: widget.task.isCompleted
                ? TextDecoration.lineThrough
                : null,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),

            Text(widget.task.description),

            const SizedBox(height: 8),

            Row(
              children: [
                Chip(
                  label: Text(widget.task.priority),
                  backgroundColor: priorityColor().withOpacity(0.15),
                ),

                const SizedBox(width: 10),

                Text(
                  "${widget.task.dueDate.day}/${widget.task.dueDate.month}/${widget.task.dueDate.year}",
                ),
              ],
            ),
          ],
        ),

        trailing: PopupMenuButton<String>(
          onSelected: (value) async {
            if (value == "view") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TaskDetailsScreen(task: widget.task),
                ),
              );
            }

            if (value == "edit") {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EditTaskScreen(task: widget.task),
                ),
              );

              setState(() {});
            }

            if (value == "delete") {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("Delete Task"),
                  content: const Text(
                    "Are you sure you want to delete this task?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        TaskService.tasks.remove(widget.task);

                        await TaskService.saveTasks();

                        Navigator.pop(context);

                        if (mounted) {
                          setState(() {});
                        }
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: "view",
              child: Text("View"),
            ),
            PopupMenuItem(
              value: "edit",
              child: Text("Edit"),
            ),
            PopupMenuItem(
              value: "delete",
              child: Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}