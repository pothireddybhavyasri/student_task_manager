import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../services/task_provider.dart';
import '../widgets/custom_button.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _title = '';
  String _description = '';
  String _priority = 'Low';
  String _dueDate = '';

  void _saveTask() {
    _formKey.currentState!.save();
    final newTask = Task(
      id: DateTime.now().toString(),
      title: _title,
      description: _description,
      priority: _priority,
      dueDate: _dueDate,
    );
    context.read<TaskProvider>().addTask(newTask);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Task Title'),
                onSaved: (value) => _title = value ?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value ?? '',
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: ['Low', 'Medium', 'High'].map((p) {
                  return DropdownMenuItem(value: p, child: Text(p));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _priority = value!;
                  });
                },
                onSaved: (value) => _priority = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Due Date'),
                onSaved: (value) => _dueDate = value ?? '',
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Save Task',
                icon: Icons.save,
                onPressed: _saveTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
