import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/task/task_list/view/task_list_provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasksProvider = TasksProvider.of(context);
    final tasks = tasksProvider.tasks;
    return Scaffold(
      appBar: AppBar(title: const Text('Task list')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(tasks[index]),
        ),
      ),
    );
  }
}
