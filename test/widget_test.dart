import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';

void main() {
  testWidgets('State management works', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const StudentTaskManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify 0 tasks
    expect(find.text('0'), findsOneWidget);

    // Tap Add Task
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();

    // Tap Save Mock Task
    await tester.tap(find.text('Save Mock Task'));
    await tester.pumpAndSettle();

    // Verify 1 task
    expect(find.text('1'), findsOneWidget);
    expect(find.text('New Mock Task'), findsOneWidget);
  });
}
