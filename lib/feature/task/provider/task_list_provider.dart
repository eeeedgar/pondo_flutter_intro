import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_complete_status.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';

class TasksProvider extends StatefulWidget {
  final Widget child;
  final TasksRepository _tasksRepository;

  const TasksProvider({
    super.key,
    required TasksRepository tasksRepository,
    required this.child,
  }) : _tasksRepository = tasksRepository;

  static _TasksProviderState of(BuildContext context) {
    final inherited = context.dependOnInheritedWidgetOfExactType<_TasksInheritedWidget>();
    assert(inherited != null, 'No TasksProvider found in context');
    return inherited!.data;
  }

  @override
  _TasksProviderState createState() => _TasksProviderState();
}

class _TasksProviderState extends State<TasksProvider> {
  List<TaskModel> tasks = [];
  late final StreamSubscription<List<TaskModel>> _subscription;

  Future<void> createTask({
    required String title,
    String? description,
  }) async =>
      await widget._tasksRepository.createTask(title: title, description: description);

  Future<void> updateTaskStatus({
    required String taskId,
    required TaskCompleteStatus status,
  }) async =>
      await widget._tasksRepository.updateTaskStatus(taskId: taskId, status: status);

  @override
  void initState() {
    super.initState();
    _subscription = widget._tasksRepository.tasksStream.listen((newTasks) {
      tasks = newTasks;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TasksInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _TasksInheritedWidget extends InheritedWidget {
  final _TasksProviderState data;

  const _TasksInheritedWidget({
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(_TasksInheritedWidget oldWidget) => true;
}
