enum Routes {
  tasks,
  createTask,
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.tasks:
        return '/';
      case Routes.createTask:
        return '/create';
    }
  }
}
