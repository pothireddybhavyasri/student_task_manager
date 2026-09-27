import 'package:flutter_test/flutter_test.dart';
import 'package:student_task_manager/models/task.dart';
import 'package:student_task_manager/services/task_provider.dart';

void main() {
  group('TaskProvider', () {
    late TaskProvider provider;

    setUp(() {
      provider = TaskProvider();
    });

    test('add and delete task', () {
      expect(provider.totalTasks, 0);

      final task = Task(id: '1', title: 'Test', description: 'Desc', priority: 'High', dueDate: 'Soon');
      provider.addTask(task);

      expect(provider.totalTasks, 1);
      
      provider.deleteTask('1');
      expect(provider.totalTasks, 0);
    });

    test('toggle completion', () {
      final task = Task(id: '2', title: 'Test', description: 'Desc', priority: 'Low', dueDate: 'Soon');
      provider.addTask(task);
      
      expect(provider.tasks.first.isCompleted, false);
      
      provider.toggleTaskCompletion('2');
      expect(provider.tasks.first.isCompleted, true);
    });

    test('search query filters tasks', () {
      provider.addTask(Task(id: '1', title: 'Apple', description: '', priority: 'Low', dueDate: ''));
      provider.addTask(Task(id: '2', title: 'Banana', description: '', priority: 'Low', dueDate: ''));

      expect(provider.tasks.length, 2);

      provider.setSearchQuery('App');
      expect(provider.tasks.length, 1);
      expect(provider.tasks.first.title, 'Apple');
    });
  });
}
