import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'screens/add_task_screen.dart';
import 'screens/edit_task_screen.dart';
import 'screens/api_demo_screen.dart';
import 'services/task_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: const StudentTaskManagerApp(),
    ),
  );
}

class StudentTaskManagerApp extends StatelessWidget {
  const StudentTaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Task Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-task': (context) => const AddTaskScreen(),
        '/edit-task': (context) => const EditTaskScreen(),
        '/api-demo': (context) => const ApiDemoScreen(),
      },
    );
  }
}
