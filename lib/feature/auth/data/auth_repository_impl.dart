import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pondo_flutter_intro/feature/auth/data/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  const AuthRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Stream<bool> get authStateChanges => _firebaseAuth.authStateChanges().map((user) => user != null);

  @override
  bool get isAuthorized => _firebaseAuth.currentUser != null;

  @override
  Future<UserCredential> signInAnonymously() => _firebaseAuth.signInAnonymously();

  @override
  Future<void> logout() => _firebaseAuth.signOut();
}
