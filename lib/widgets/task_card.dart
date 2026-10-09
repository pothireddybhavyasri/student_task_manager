import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/task.dart';
import '../services/task_provider.dart';
import '../screens/task_details_screen.dart';
import '../utils/themes.dart';
import 'priority_chip.dart';
import 'status_chip.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(task: task),
          ),
        );
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: task.isCompleted ? 0.7 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            color: task.isCompleted ? const Color(0xFFF9FAFB) : AppColors.card,
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: task.isCompleted ? AppColors.border.withValues(alpha: 0.5) : AppColors.border,
              width: 1,
            ),
            boxShadow: task.isCompleted
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.read<TaskProvider>().toggleTaskCompletion(task.id);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: task.isCompleted ? AppColors.success.withValues(alpha: 0.1) : Colors.transparent,
                        ),
                        child: Icon(
                          task.isCompleted ? Icons.check_circle : Icons.circle_outlined,
                          color: task.isCompleted ? AppColors.success : AppColors.textSecondary,
                          size: 24,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            task.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMain,
                              decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            task.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: AppColors.textMain.withValues(alpha: 0.8), // Dark readable text
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        // Show options menu (Edit/Delete)
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => _buildOptions(context),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Divider(height: 1, color: AppColors.border),
              // Footer row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16, color: AppColors.textMain),
                        const SizedBox(width: 6),
                        Text(
                          task.dueDate,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textMain,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        PriorityChip(priority: task.priority),
                        const SizedBox(width: 8),
                        StatusChip(isCompleted: task.isCompleted),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit, color: AppColors.primary),
            title: const Text('Edit Task'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/edit-task', arguments: task);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete, color: AppColors.highPriority),
            title: const Text('Delete Task'),
            onTap: () {
              context.read<TaskProvider>().deleteTask(task.id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
