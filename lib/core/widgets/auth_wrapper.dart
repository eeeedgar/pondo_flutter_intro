import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/core/widgets/authorized_area.dart';
import 'package:pondo_flutter_intro/feature/auth/provider/auth_provider.dart';
import 'package:pondo_flutter_intro/feature/auth/view/auth_sign_in_anonymous_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      AuthorirazionProvider.of(context).isAuthorized ? const AuthorizedArea() : const AuthSignInAnonymousScreen();
}
