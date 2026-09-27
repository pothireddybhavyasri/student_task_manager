import 'package:flutter_test/flutter_test.dart';
import 'package:student_task_manager/main.dart';

void main() {
  testWidgets('App load foundation test', (WidgetTester tester) async {
    await tester.pumpWidget(const StudentTaskManagerApp());

    expect(find.text('Student Task Manager Foundation'), findsOneWidget);
  });
}
