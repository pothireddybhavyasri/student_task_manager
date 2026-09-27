import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:student_task_manager/main.dart';

void main() {
  testWidgets('App loads and shows responsive task manager widgets', (WidgetTester tester) async {
    // Test Phone Size
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    
    await tester.pumpWidget(const StudentTaskManagerApp());
    await tester.pumpAndSettle();

    expect(find.text('Student Task Manager'), findsWidgets);
    expect(find.byType(ListView), findsOneWidget);

    // Test Tablet Size
    tester.view.physicalSize = const Size(800, 1024);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(const StudentTaskManagerApp());
    await tester.pumpAndSettle();

    expect(find.byType(GridView), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
