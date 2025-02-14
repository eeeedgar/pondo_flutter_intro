import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(task.title),
      subtitle: Text(task.description ?? ''),
      trailing: Checkbox(
        value: task.status == TaskCompleteStatus.completed,
        onChanged: (value) => _onCheckboxChanged(context, value),
      ),
    );
  }

  void _onCheckboxChanged(BuildContext context, bool? value) {
    TasksProvider.of(context).updateTaskStatus(
      taskId: task.id,
      status: value ?? false ? TaskCompleteStatus.completed : TaskCompleteStatus.pending,
    );
  }
}
