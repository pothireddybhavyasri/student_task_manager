import 'package:flutter_test/flutter_test.dart';
import 'package:student_task_manager/models/task.dart';

void main() {
  group('Task Model', () {
    test('copyWith updates fields correctly', () {
      final task = Task(
        id: '1',
        title: 'Original Title',
        description: 'Original Description',
        priority: 'Low',
        dueDate: 'Today',
      );

      final updatedTask = task.copyWith(
        title: 'New Title',
        isCompleted: true,
      );

      expect(updatedTask.id, '1');
      expect(updatedTask.title, 'New Title');
      expect(updatedTask.description, 'Original Description');
      expect(updatedTask.isCompleted, true);
    });
  });
}
