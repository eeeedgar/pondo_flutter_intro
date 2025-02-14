import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart';
import 'package:pondo_flutter_intro/feature/task/view/widgets/task_list_tile.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = TasksProvider.of(context);
    final tasks = tasksProvider.tasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task list'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => AuthProvider.of(context).logout(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabPressed(context),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskListTile(
          task: tasks[index],
        ),
      ),
    );
  }

  void _onFabPressed(BuildContext context) => Navigator.of(context).pushNamed('/create');
}
