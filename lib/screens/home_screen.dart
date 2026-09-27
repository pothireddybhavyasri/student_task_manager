import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/task_provider.dart';
import '../widgets/task_card.dart';
import '../widgets/custom_button.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search Tasks',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
              context.read<TaskProvider>().setSearchQuery('');
            },
          ),
        ),
        onChanged: (value) {
          context.read<TaskProvider>().setSearchQuery(value);
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final paddingValue = mediaQuery.size.width * 0.02;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Task Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          children: [
            const SearchBox(),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total Tasks:'),
                  Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      return Text('${provider.totalTasks}', style: const TextStyle(fontWeight: FontWeight.bold));
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<TaskProvider>(
                builder: (context, provider, child) {
                  final tasks = provider.tasks;
                  if (tasks.isEmpty) {
                    return const Center(child: Text('No tasks yet. Add one!'));
                  }
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 600) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.0,
                          ),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskCard(task: tasks[index]);
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return TaskCard(task: tasks[index]);
                          },
                        );
                      }
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomButton(
                    label: isLandscape ? 'Add New Student Task' : 'Add Task',
                    icon: Icons.add,
                    onPressed: () {
                      Navigator.pushNamed(context, '/add-task');
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomButton(
                    label: 'API Demo',
                    onPressed: () => Navigator.pushNamed(context, '/api-demo'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
