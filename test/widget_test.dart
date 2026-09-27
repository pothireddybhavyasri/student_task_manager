import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_task_manager/main.dart';
import 'package:student_task_manager/services/task_provider.dart';
import 'package:student_task_manager/widgets/custom_button.dart';

void main() {
  testWidgets('API Demo Screen handles network state', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => TaskProvider(),
        child: const StudentTaskManagerApp(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(CustomButton, 'API Demo'));
    
    // Pump a single frame to see the loading indicator
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    
    // Pump and settle to let the mock HTTP throw an exception (expected in tests)
    await tester.pumpAndSettle();
    
    // Real HTTP requests return 400 in test environments, triggering our error block
    expect(find.textContaining('Error:'), findsOneWidget);
    
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
  });
}
