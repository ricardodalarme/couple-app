import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:logger/logger.dart';

class AuthenticationRepository({required final AuthenticationService _authenticationService}) {
  final Logger _logger = Logger('AuthRepository');
  bool get isAuthenticated => _authenticationService.isAuthenticated;
  Stream<bool> get isAuthenticatedStream => _authenticationService.authStateChanges;

  String? getAccessToken() => _authenticationService.currentSession?.accessToken;

  /// The signed-in user's id, which is also the profile id.
  String? get currentUserId => _authenticationService.currentSession?.user.id;

  Future<void> logInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _authenticationService.signInWithEmailAndPassword(email: email, password: password);
    } on AuthenticationException catch (exception, stackTrace) {
      _logger.error('Failed to sign in', error: exception, stackTrace: stackTrace);
      throw _toLocalizedException(exception);
    }
  }

  Future<void> signUpWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _authenticationService.signUpWithEmailAndPassword(email: email, password: password);
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> logInWithGoogle() async {
    try {
      await _authenticationService.signInWithGoogle();
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> logInWithApple() async {
    try {
      await _authenticationService.signInWithApple();
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> logOut() async {
    await _authenticationService.signOut();
  }

  LocalizedException _toLocalizedException(AuthenticationException exception) {
    return LocalizedException(l10nKey: exception.code);
  }
}
