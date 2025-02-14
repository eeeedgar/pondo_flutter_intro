import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart';
import 'package:pondo_flutter_intro/feature/task/view/screens/task_create_screen.dart';
import 'package:pondo_flutter_intro/feature/task/view/screens/task_list_screen.dart';

class AuthorizedArea extends StatelessWidget {
  const AuthorizedArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TasksProvider(
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => const TaskListScreen();
              break;
            case '/create':
              builder = (BuildContext context) => const TaskCreateScreen();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
