import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:student_task_manager/main.dart';

void main() {
  testWidgets('App loads and shows task manager widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentTaskManagerApp());
    await tester.pumpAndSettle();

    expect(find.text('Student Task Manager'), findsWidgets); // AppBar title
    expect(find.text('Total Tasks:'), findsOneWidget);
    expect(find.text('Add Task'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
