import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:logger/logger.dart';

class AuthenticationRepository {
  AuthenticationRepository({required AuthenticationService authenticationService})
    : _authenticationService = authenticationService;

  final Logger _logger = Logger('AuthRepository');
  final AuthenticationService _authenticationService;

  Stream<bool> get isAuthenticated async* {
    yield _authenticationService.isAuthenticated;
    yield* _authenticationService.authStateChanges;
  }

  String? getAccessToken() => _authenticationService.currentSession?.accessToken;

  Future<void> logInWithEmailAndPassword({required String email, required String password}) async {
    try {
      _logger.info('Attempting login for user: $email');

      await _authenticationService.signInWithEmailAndPassword(email: email, password: password);
    } on AuthenticationException catch (exception, stackTrace) {
      _logger.error('Failed to log in user: $email', error: exception, stackTrace: stackTrace);
      throw _toLocalizedException(exception);
    }
  }

  Future<void> logOut() async {
    await _authenticationService.signOut();
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

  Future<void> signup({required String email, required String password}) async {
    try {
      await _authenticationService.signUpWithEmailAndPassword(email: email, password: password);
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _authenticationService.resetPasswordForEmail(email: email);
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      await _authenticationService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      await _authenticationService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
    } on AuthenticationException catch (exception) {
      throw _toLocalizedException(exception);
    }
  }

  LocalizedException _toLocalizedException(AuthenticationException exception) {
    return LocalizedException(l10nKey: exception.code);
  }
}
