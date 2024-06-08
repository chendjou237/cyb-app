
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/repositories/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthenticationRepository _authRepository;

  AuthCubit(this._authRepository) : super( AuthState.unknown());

  void appStarted() {
    final user = _authRepository.user;
    if (user == null) {
      emit( AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user));
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      emit(AuthState.authenticated(_authRepository.user!));
    } catch (e) {
      emit( AuthState.unauthenticated());
    }
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.signUpWithEmailAndPassword(email, password);
      emit(AuthState.authenticated(_authRepository.user!));
    } catch (e) {
      emit( AuthState.unauthenticated());
    }
  }

  Future<void> logout() async {
    await _authRepository.signOut();
    emit( AuthState.unauthenticated());
  }
}