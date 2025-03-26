import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/change_password_data_source.dart';

class ChangePasswordRepository {
  const ChangePasswordRepository({required ChangePasswordDataSource changePasswordDataSource})
    : _changePasswordDataSource = changePasswordDataSource;

  final ChangePasswordDataSource _changePasswordDataSource;

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await _changePasswordDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
