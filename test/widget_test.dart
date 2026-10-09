import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';
import 'package:student_task_manager/widgets/custom_button.dart';

void main() {
  testWidgets('App E2E Test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const StudentTaskManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    // Verify initial state
    expect(find.text('0'), findsOneWidget);

    // Add a Task
    await tester.tap(find.widgetWithText(CustomButton, 'Add Task'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).at(0), 'Final Task');
    await tester.enterText(find.byType(TextFormField).at(1), 'Final description');
    await tester.enterText(find.byType(TextFormField).at(2), 'Tomorrow');
    
    await tester.tap(find.text('Save Task'));
    await tester.pumpAndSettle();

    expect(find.text('Final Task'), findsOneWidget);

    // Toggle Task
    await tester.tap(find.byIcon(Icons.circle_outlined));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    // Navigate to API Demo (assert error appears)
    await tester.tap(find.widgetWithText(CustomButton, 'API Demo'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Error:'), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
