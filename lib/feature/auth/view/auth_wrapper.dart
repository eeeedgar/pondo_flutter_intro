import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/view/auth_provider.dart';
import 'package:pondo_flutter_intro/feature/auth/view/auth_sign_in_anonymous_screen.dart';
import 'package:pondo_flutter_intro/feature/task/task_list/view/task_list_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    if (auth.user != null) {
      return const TaskListScreen();
    } else {
      return const AuthSignInAnonymousScreen();
    }
  }
}
