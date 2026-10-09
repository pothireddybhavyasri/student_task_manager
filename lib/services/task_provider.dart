import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  String _searchQuery = '';

  List<Task> get tasks {
    if (_searchQuery.isEmpty) return _tasks;
    return _tasks
        .where((t) => t.title.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  int get totalTasks => _tasks.length;
  int get pendingTasks => _tasks.where((t) => !t.isCompleted).length;
  int get completedTasks => _tasks.where((t) => t.isCompleted).length;
  int get highPriorityTasks => _tasks.where((t) => !t.isCompleted && t.priority == 'High').length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(String id, Task updatedTask) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void toggleTaskCompletion(String id) {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(isCompleted: !_tasks[index].isCompleted);
      notifyListeners();
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
