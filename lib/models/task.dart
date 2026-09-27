class Task {
  final String title;
  final String description;
  final String priority;
  final String dueDate;
  final bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
    this.isCompleted = false,
  });
}
