import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart';
import 'package:pondo_flutter_intro/feature/task/view/widgets/task_list_tile.dart';
import 'package:pondo_flutter_intro/router/routes.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = TasksProvider.of(context);
    final tasks = tasksProvider.filteredTasks;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task list'),
        actions: [
          IconButton(
            icon: Icon(
              tasksProvider.filter == TaskFilter.all ? Icons.filter_alt : Icons.filter_alt_outlined,
            ),
            onPressed: () => _onFilterPressed(context),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _onLogoutPressed(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onFabPressed(context),
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (context, index) => TaskListTile(
          task: tasks[index],
        ),
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }

  void _onFabPressed(BuildContext context) => Navigator.of(context).pushNamed(Routes.createTask.path);

  void _onLogoutPressed(BuildContext context) => AuthorirazionProvider.of(context).logout(context);

  void _onFilterPressed(BuildContext context) {
    final tasksProvider = TasksProvider.of(context);
    final filter = tasksProvider.filter;
    final newFilter = filter == TaskFilter.all ? TaskFilter.pending : TaskFilter.all;
    tasksProvider.setFilter(newFilter);
  }
}
