import 'dart:async';

abstract interface class AuthenticationRepository {
  Stream<bool> get isAuthenticated;

  void dispose();

  Future<void> checkAuthenticationStatus();

  Future<void> logInWithUsernameAndPassword({required String username, required String password});

  Future<void> logInWithGoogle();
  Future<void> logInWithFacebook();

  Future<void> logOut();
}
