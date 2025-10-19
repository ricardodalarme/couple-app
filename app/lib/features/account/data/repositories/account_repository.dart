import 'package:quickstart_flutter_bloc/features/account/data/data_sources/account_data_source.dart';

class AccountRepository {
  const AccountRepository({required AccountDataSource accountDataSource})
    : _accountDataSource = accountDataSource;

  final AccountDataSource _accountDataSource;

  Future<void> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    await _accountDataSource.updateUser(firstName: firstName, lastName: lastName, email: email);
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _accountDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
