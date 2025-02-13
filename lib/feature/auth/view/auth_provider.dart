import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends StatefulWidget {
  final Widget child;
  const AuthProvider({
    super.key,
    required this.child,
  });

  static _AuthProviderState of(BuildContext context) {
    final _AuthInheritedWidget? inherited = context.dependOnInheritedWidgetOfExactType<_AuthInheritedWidget>();
    assert(inherited != null, 'No AuthProvider found in context');
    return inherited!.data;
  }

  @override
  _AuthProviderState createState() => _AuthProviderState();
}

class _AuthProviderState extends State<AuthProvider> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  late final StreamSubscription<User?> _authSubscription;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _authSubscription = _auth.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.message}")),
      );
    }
  }

  User? get user => _user;

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AuthInheritedWidget(
      data: this,
      child: widget.child,
    );
  }
}

class _AuthInheritedWidget extends InheritedWidget {
  final _AuthProviderState data;

  const _AuthInheritedWidget({
    required super.child,
    required this.data,
  });

  @override
  bool updateShouldNotify(_AuthInheritedWidget oldWidget) => true;
}
