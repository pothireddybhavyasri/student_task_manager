import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';
import 'package:student_task_manager/widgets/custom_button.dart';

void main() {
  testWidgets('State management and custom widgets work', (WidgetTester tester) async {
    // Set explicit size to prevent overflow or adaptive layout issues that hide text
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const StudentTaskManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify 0 tasks
    expect(find.text('0'), findsOneWidget);

    // Tap Add Task via CustomButton
    final addButton = find.widgetWithText(CustomButton, 'Add Task');
    expect(addButton, findsOneWidget);
    await tester.tap(addButton);
    await tester.pumpAndSettle();

    // Tap Save Mock Task
    await tester.tap(find.text('Save Mock Task'));
    await tester.pumpAndSettle();

    // Verify 1 task
    expect(find.text('1'), findsOneWidget);
    expect(find.text('New Mock Task'), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
