import '../models/task.dart';

class TaskService {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
  }

  void toggleTask(int id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;
  }
}