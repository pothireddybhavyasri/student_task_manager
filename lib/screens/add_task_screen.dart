import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/task_service.dart';
import '../utils/constants.dart';
import '../utils/validators.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String priority = "Medium";
  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> saveTask() async {
    if (!_formKey.currentState!.validate()) return;

    TaskService.tasks.add(
      Task(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        priority: priority,
        dueDate: selectedDate,
      ),
    );

    await TaskService.saveTasks();

    if (!mounted) return;

    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: titleController,
                label: "Task Title",
                validator: Validators.validateTitle,
              ),

              const SizedBox(height: 20),

              CustomTextField(
                controller: descriptionController,
                label: "Task Description",
                maxLines: 4,
                validator: Validators.validateDescription,
              ),

              const SizedBox(height: 20),

              DropdownButtonFormField<String>(
                initialValue: priority,
                decoration: const InputDecoration(
                  labelText: "Priority",
                  border: OutlineInputBorder(),
                ),
                items: priorities.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    priority = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                ),
                trailing: ElevatedButton(
                  onPressed: pickDate,
                  child: const Text("Pick Date"),
                ),
              ),

              const SizedBox(height: 30),

              CustomButton(
                title: "Save Task",
                onPressed: saveTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}