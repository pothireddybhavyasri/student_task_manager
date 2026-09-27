import 'package:flutter/material.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Task')),
      body: const Center(child: Text('Edit Task Form Placeholder')),
    );
  }
}
