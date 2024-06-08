
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:test1/utils/logger.dart';

class AuthenticationRepository{
  final auth = FirebaseAuth.instance;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (kDebugMode) {
        logE(e);
      }
      throw Exception('Failed to sign in');
    }
    // Sign in with email and password
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (kDebugMode) {
        logE(e);
      }
      throw Exception('Failed to sign up');
    }
    // Sign up with email and password
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      if (kDebugMode) {
        logE(e);
      }
      throw Exception('Failed to sign out');
    }
    // Sign out
  }

  User? get user => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

}