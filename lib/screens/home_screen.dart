import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/task_provider.dart';
import '../widgets/task_card.dart';
import '../utils/themes.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(color: AppColors.textMain),
      decoration: InputDecoration(
        hintText: 'Search tasks...',
        prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: AppColors.textSecondary, size: 20),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                  context.read<TaskProvider>().setSearchQuery('');
                },
              )
            : null,
      ),
      onChanged: (value) {
        setState(() {}); // to update suffix icon
        context.read<TaskProvider>().setSearchQuery(value);
      },
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const SummaryCard({
    super.key,
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              Text(
                '$count',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isDesktop = mediaQuery.size.width > 800;
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.check_circle_outline, color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            const Text('Student Task Manager'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.api),
            tooltip: 'API Demo',
            onPressed: () => Navigator.pushNamed(context, '/api-demo'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your tasks, under control.',
                            style: GoogleFonts.inter(
                              fontSize: isDesktop ? 32 : 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textMain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Organize, track, and complete your academic work efficiently.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isDesktop)
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add, size: 20),
                        label: const Text('Add New Task'),
                        onPressed: () => Navigator.pushNamed(context, '/add-task'),
                      ),
                  ],
                ),
                if (!isDesktop) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.add, size: 20),
                      label: const Text('Add New Task'),
                      onPressed: () => Navigator.pushNamed(context, '/add-task'),
                    ),
                  ),
                ],
                const SizedBox(height: 32),
                
                // Summary Cards
                Consumer<TaskProvider>(
                  builder: (context, provider, child) {
                    return GridView.count(
                      crossAxisCount: isDesktop ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.5,
                      children: [
                        SummaryCard(
                          title: 'Total Tasks',
                          count: provider.totalTasks,
                          color: AppColors.primary,
                          icon: Icons.list_alt,
                        ),
                        SummaryCard(
                          title: 'Pending',
                          count: provider.pendingTasks,
                          color: AppColors.pending,
                          icon: Icons.pending_actions,
                        ),
                        SummaryCard(
                          title: 'Completed',
                          count: provider.completedTasks,
                          color: AppColors.success,
                          icon: Icons.task_alt,
                        ),
                        SummaryCard(
                          title: 'High Priority',
                          count: provider.highPriorityTasks,
                          color: AppColors.highPriority,
                          icon: Icons.priority_high,
                        ),
                      ],
                    );
                  }
                ),
                const SizedBox(height: 32),
                
                // Search and Filters
                const Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SearchBox(),
                    ),
                    // Could add filters here if needed
                  ],
                ),
                const SizedBox(height: 24),
                
                // Task List
                Expanded(
                  child: Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      final tasks = provider.tasks;
                      if (tasks.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.assignment_turned_in, size: 64, color: AppColors.border),
                              const SizedBox(height: 16),
                              Text(
                                'No tasks found',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isDesktop ? 3 : 1,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          mainAxisExtent: 200, // Fixed height for cards
                        ),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCard(task: tasks[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
