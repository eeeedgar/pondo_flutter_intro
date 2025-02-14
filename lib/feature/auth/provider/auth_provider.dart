import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pondo_flutter_intro/feature/auth/data/auth_repository.dart';

class AuthorirazionProvider extends StatefulWidget {
  final AuthRepository _authRepository;
  final Widget child;

  const AuthorirazionProvider({
    super.key,
    required this.child,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  static _AuthorirazionProviderState of(BuildContext context) {
    final _AuthInheritedWidget? inherited = context.dependOnInheritedWidgetOfExactType<_AuthInheritedWidget>();
    assert(inherited != null, 'No AuthProvider found in context');
    return inherited!.data;
  }

  @override
  _AuthorirazionProviderState createState() => _AuthorirazionProviderState();
}

class _AuthorirazionProviderState extends State<AuthorirazionProvider> {
  late final StreamSubscription<bool?> _authSubscription;
  late bool _isAuthorized;

  bool get isAuthorized => _isAuthorized;

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await widget._authRepository.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await widget._authRepository.logout();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _isAuthorized = widget._authRepository.isAuthorized;
    _authSubscription = widget._authRepository.authStateChanges.listen((isAuthorized) {
      setState(() {
        _isAuthorized = isAuthorized;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _AuthInheritedWidget(
      data: this,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}

class _AuthInheritedWidget extends InheritedWidget {
  final _AuthorirazionProviderState data;

  const _AuthInheritedWidget({
    required super.child,
    required this.data,
  });

  @override
  bool updateShouldNotify(_AuthInheritedWidget oldWidget) => true;
}
