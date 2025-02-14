import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:pondo_flutter_intro/core/theme/theme_controller.dart';
import 'package:pondo_flutter_intro/core/theme/theme_dark.dart';
import 'package:pondo_flutter_intro/core/theme/theme_light.dart';
import 'package:pondo_flutter_intro/di/app_dependencies.dart';
import 'package:pondo_flutter_intro/feature/auth/data/auth_repository_impl.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';
import 'package:pondo_flutter_intro/core/widgets/auth_wrapper.dart';
import 'package:pondo_flutter_intro/feature/task/data/task_repository_impl.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ThemeModel(
      child: AppDependencies(
        authRepository: AuthRepositoryImpl(
          firebaseAuth: FirebaseAuth.instance,
        ),
        tasksRepository: TasksRepositoryImpl(
          tasksRef: FirebaseDatabase.instance.ref().child('tasks'),
        ),
        child: const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) => AuthorirazionProvider(
        authRepository: AppDependencies.of(context).authRepository,
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeController.of(context).themeMode,
          home: AuthWrapper(),
        ),
      );
}
