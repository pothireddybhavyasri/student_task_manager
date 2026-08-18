import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const StudentTaskManager());
}

class StudentTaskManager extends StatelessWidget {
  const StudentTaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}
