import 'package:logger/logger.dart';
import 'package:quickstart_flutter_bloc/features/account/data/data_sources/account_data_source.dart';

class AccountRepository {
  AccountRepository({required AccountDataSource accountDataSource})
    : _accountDataSource = accountDataSource;

  final Logger _logger = Logger('AccountRepository');
  final AccountDataSource _accountDataSource;

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    _logger.info('Updating profile for $email');
    try {
      await _accountDataSource.updateUser(firstName: firstName, lastName: lastName, email: email);
      _logger.info('Profile updated for $email');
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
      await _accountDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      _logger.info('Password changed successfully');
    } catch (e, stack) {
      _logger.error('Failed to change password', error: e, stackTrace: stack);
      rethrow;
    }
  }
}
