part of 'auth_cubit.dart';

@immutable
class AuthState  {
  final User? user;

  const AuthState(this.user);

  factory AuthState.unknown() => const AuthState(null);

  factory AuthState.authenticated(User user) => AuthState(user);

  factory AuthState.unauthenticated() => const AuthState(null);
}