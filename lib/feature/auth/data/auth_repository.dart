import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Stream<bool> get authStateChanges;

  bool get isAuthorized;

  Future<UserCredential> signInAnonymously();

  Future<void> logout();
}
