import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';

class AuthSignInAnonymousScreen extends StatelessWidget {
  const AuthSignInAnonymousScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthorirazionProvider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => auth.signInAnonymously(context),
          child: const Text('Sign In Anonymously'),
        ),
      ),
    );
  }
}
