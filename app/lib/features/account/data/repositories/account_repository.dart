import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:logger/logger.dart';

class AccountRepository {
  AccountRepository({required this._authenticationService});

  final Logger _logger = Logger('AccountRepository');
  final AuthenticationService _authenticationService;

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    _logger.info('Updating profile for $email');
    try {
      await _authenticationService.updateProfile(
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      _logger.info('Profile updated for $email');
    } on AuthenticationException catch (exception, stack) {
      _logger.error('Failed to update profile', error: exception, stackTrace: stack);
      throw _toLocalizedException(exception);
    } catch (e, stack) {
      _logger.error('Failed to update profile', error: e, stackTrace: stack);
      rethrow;
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    _logger.info('Changing password');
    try {
      await _authenticationService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      _logger.info('Password changed successfully');
    } on AuthenticationException catch (exception, stack) {
      _logger.error('Failed to change password', error: exception, stackTrace: stack);
      throw _toLocalizedException(exception);
    } catch (e, stack) {
      _logger.error('Failed to change password', error: e, stackTrace: stack);
      rethrow;
    }
  }

  LocalizedException _toLocalizedException(AuthenticationException exception) {
    return LocalizedException(l10nKey: exception.code);
  }
}
