import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<bool> get authStateChanges => _firebaseAuth.authStateChanges().map((user) => user != null);

  bool get isAuthorized => _firebaseAuth.currentUser != null;

  Future<UserCredential> signInAnonymously() => _firebaseAuth.signInAnonymously();

  Future<void> logout() => _firebaseAuth.signOut();
}
