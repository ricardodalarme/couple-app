import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/forgot_password_data_source.dart';

class ForgotPasswordRepository {
  const ForgotPasswordRepository({required ForgotPasswordDataSource forgotPasswordDataSource})
    : _forgotPasswordDataSource = forgotPasswordDataSource;

  final ForgotPasswordDataSource _forgotPasswordDataSource;

  Future<void> forgotPassword({required String email}) async {
    await _forgotPasswordDataSource.forgotPassword(email: email);
  }
}
