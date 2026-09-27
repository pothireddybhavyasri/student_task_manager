import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';
import 'package:student_task_manager/widgets/custom_button.dart';

void main() {
  testWidgets('Form validation works', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const StudentTaskManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Navigate to Add Task
    final addButton = find.widgetWithText(CustomButton, 'Add Task');
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Tap Save without entering data to trigger validation
    await tester.tap(find.text('Save Task'));
    await tester.pump(); // trigger validation rebuild

    // Verify error messages
    expect(find.text('Please enter a task title'), findsOneWidget);
    expect(find.text('Please enter a description'), findsOneWidget);
    expect(find.text('Please enter a due date'), findsOneWidget);
    
    // Fill out form
    await tester.enterText(find.byType(TextFormField).at(0), 'Valid Task');
    await tester.enterText(find.byType(TextFormField).at(1), 'Valid description');
    await tester.enterText(find.byType(TextFormField).at(2), 'Tomorrow');
    
    await tester.tap(find.text('Save Task'));
    await tester.pumpAndSettle();

    // Verify task is added to home screen
    expect(find.text('Valid Task'), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
