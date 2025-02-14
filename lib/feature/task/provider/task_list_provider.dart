import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository.dart';
import 'package:pondo_flutter_intro/feature/task/model/task_model.dart';

class TasksProvider extends StatefulWidget {
  final Widget child;
  const TasksProvider({super.key, required this.child});

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
  final TasksRepository _tasksRepository = TasksRepository();
  late final StreamSubscription<List<TaskModel>> _subscription;

  Future<void> createTask({
    required String title,
    String? description,
  }) async {
    await _tasksRepository.createTask(title: title, description: description);
  }

  @override
  void initState() {
    super.initState();
    _subscription = _tasksRepository.tasksStream.listen((newTasks) {
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
