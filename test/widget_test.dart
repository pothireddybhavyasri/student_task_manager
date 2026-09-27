import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';
import 'package:student_task_manager/widgets/custom_button.dart';

void main() {
  testWidgets('Animation and state test', (WidgetTester tester) async {
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
    await tester.tap(find.widgetWithText(CustomButton, 'Add Task'));
    await tester.pumpAndSettle();

    // Fill out form
    await tester.enterText(find.byType(TextFormField).at(0), 'Anim Task');
    await tester.enterText(find.byType(TextFormField).at(1), 'Anim description');
    await tester.enterText(find.byType(TextFormField).at(2), 'Tomorrow');
    await tester.tap(find.text('Save Task'));
    await tester.pumpAndSettle();

    expect(find.text('Anim Task'), findsOneWidget);

    // Toggle completion to trigger animations
    await tester.tap(find.byIcon(Icons.circle_outlined));
    
    // Pump frames to complete the 500ms animation
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check_circle), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
