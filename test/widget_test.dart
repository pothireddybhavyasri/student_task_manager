import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:student_task_manager/main.dart';

void main() {
  testWidgets('App navigation works', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const StudentTaskManagerApp());
    await tester.pumpAndSettle();

    expect(find.text('Student Task Manager'), findsWidgets);

    // Tap Add Task button
    await tester.tap(find.text('Add Task'));
    await tester.pumpAndSettle();

    // Verify Add Task Screen
    expect(find.text('Add Task Form Placeholder'), findsOneWidget);
    
    // Tap back button in AppBar
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Total Tasks:'), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
