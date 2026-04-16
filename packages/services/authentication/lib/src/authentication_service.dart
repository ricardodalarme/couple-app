import 'package:authentication_service/src/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationService {
  AuthenticationService();

  GoTrueClient get _auth => Supabase.instance.client.auth;

  Session? get currentSession => _auth.currentSession;

  Future<void> initialize({required String url, required String anonKey}) async {
    if (url.isEmpty || anonKey.isEmpty) {
      throw const AuthenticationException(code: 'invalid_configuration');
    }

    await Supabase.initialize(url: url, anonKey: anonKey);
  }

  bool get isAuthenticated => currentSession?.isExpired == false;

  Stream<bool> get authStateChanges =>
      _auth.onAuthStateChange.map((_) => isAuthenticated).distinct();

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithPassword(email: email, password: password);
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signUp(email: email, password: password);
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> resetPasswordForEmail({required String email}) async {
    try {
      await _auth.resetPasswordForEmail(email);
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _auth.signInWithOAuth(OAuthProvider.google);
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> signInWithApple() async {
    try {
      await _auth.signInWithOAuth(OAuthProvider.apple);
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final email = _auth.currentUser?.email;
      if (email == null || email.isEmpty) {
        throw const AuthenticationException(code: 'user_not_found');
      }

      await _auth.signInWithPassword(email: email, password: currentPassword);
      await _auth.updateUser(UserAttributes(password: newPassword));
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> updateProfile({
    required String email,
    required String firstName,
    required String lastName,
  }) async {
    try {
      await _auth.updateUser(
        UserAttributes(email: email, data: {'first_name': firstName, 'last_name': lastName}),
      );
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on AuthException catch (error, stackTrace) {
      Error.throwWithStackTrace(AuthenticationException(code: error.code), stackTrace);
    }
  }
}
