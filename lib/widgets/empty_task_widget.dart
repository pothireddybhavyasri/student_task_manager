import 'package:flutter/material.dart';

class EmptyTaskWidget extends StatelessWidget {
  const EmptyTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Tasks Yet",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}