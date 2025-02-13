import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';
import 'package:pondo_flutter_intro/feature/auth/view/auth_sign_in_anonymous_screen.dart';
import 'package:pondo_flutter_intro/feature/task/provider/task_list_provider.dart';
import 'package:pondo_flutter_intro/feature/task/view/screens/task_list_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) => AuthProvider.of(context).isAuthorized
      ? const TasksProvider(
          child: TaskListScreen(),
        )
      : const AuthSignInAnonymousScreen();
}
