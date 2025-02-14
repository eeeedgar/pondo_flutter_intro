import 'package:flutter/material.dart';

import 'package:pondo_flutter_intro/feature/auth/data/auth_repository_impl.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository_impl.dart';

class AppDependencies extends InheritedWidget {
  final AuthRepositoryImpl authRepository;
  final TasksRepositoryImpl tasksRepository;

  const AppDependencies({
    super.key,
    required super.child,
    required this.authRepository,
    required this.tasksRepository,
  });

  static AppDependencies of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppDependencies>();
    assert(result != null, 'No AppDependencies found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant AppDependencies oldWidget) {
    return authRepository != oldWidget.authRepository || tasksRepository != oldWidget.tasksRepository;
  }
}
