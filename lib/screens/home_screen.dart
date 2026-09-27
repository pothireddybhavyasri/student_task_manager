import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import 'task_details_screen.dart';
import '../services/task_provider.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search Tasks',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
              context.read<TaskProvider>().setSearchQuery('');
            },
          ),
        ),
        onChanged: (value) {
          context.read<TaskProvider>().setSearchQuery(value);
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final paddingValue = mediaQuery.size.width * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Task Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          children: [
            const SearchBox(),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              color: Colors.blue.shade50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Tasks:'),
                  Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      return Text('${provider.totalTasks}', style: const TextStyle(fontWeight: FontWeight.bold));
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, provider, child) {
                  final tasks = provider.tasks;
                  if (tasks.isEmpty) {
                    return const Center(child: Text('No tasks yet. Add one!'));
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.0,
                          ),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskCardWidget(task: tasks[index]);
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskCardWidget(task: tasks[index]);
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/add-task');
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(width: 8),
                        Text(isLandscape ? 'Add New Student Task' : 'Add Task'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/api-demo'),
                    child: const Text('API Demo'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskCardWidget extends StatelessWidget {
  final Task task;

  const TaskCardWidget({super.key, required this.task});

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
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
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
                  ],
                ),
                const SizedBox(height: 8),
                Text(task.description),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, size: 16),
                          const SizedBox(width: 4),
                          Flexible(child: Text(task.dueDate, overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Priority: ${task.priority}',
                        style: TextStyle(
                          color: task.priority == 'High' ? Colors.red : Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
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
    );
  }
}
