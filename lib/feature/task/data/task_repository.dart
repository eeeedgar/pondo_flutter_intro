import 'dart:async';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';

abstract class TasksRepository {
  Stream<List<TaskModel>> get tasksStream;

  Future<void> createTask({
    required String title,
    String? description,
  });

  Future<void> updateTaskStatus({
    required String taskId,
    required TaskCompleteStatus status,
  });
}
