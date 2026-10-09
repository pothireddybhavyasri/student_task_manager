import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/task.dart';
import '../services/task_provider.dart';
import '../widgets/custom_button.dart';
import '../utils/themes.dart';

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
    if (_formKey.currentState!.validate()) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Task'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Task Details',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textMain,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Task Title',
                        hintText: 'Enter task title',
                      ),
                      style: const TextStyle(color: AppColors.textMain),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a task title';
                        }
                        return null;
                      },
                      onSaved: (value) => _title = value!.trim(),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText: 'Enter description',
                      ),
                      maxLines: 3,
                      style: const TextStyle(color: AppColors.textMain),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a description';
                        }
                        if (value.trim().length < 5) {
                          return 'Description must be at least 5 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) => _description = value!.trim(),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: _priority,
                      dropdownColor: AppColors.card,
                      decoration: const InputDecoration(labelText: 'Priority'),
                      style: const TextStyle(color: AppColors.textMain),
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
                      decoration: const InputDecoration(
                        labelText: 'Due Date',
                        hintText: 'e.g., 2026-12-01',
                        prefixIcon: Icon(Icons.calendar_today, color: AppColors.textSecondary),
                      ),
                      style: const TextStyle(color: AppColors.textMain),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter a due date';
                        }
                        return null;
                      },
                      onSaved: (value) => _dueDate = value!.trim(),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          ),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.inter(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        CustomButton(
                          label: 'Save Task',
                          icon: Icons.save,
                          onPressed: _saveTask,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
