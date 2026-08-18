import 'package:flutter/material.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.assignment_outlined,
            size: 90,
            color: Colors.grey,
          ),
          SizedBox(height: 20),
          Text(
            "No Tasks Yet",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Tap the + button to add your first task",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}