import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/forgot_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  const ForgotPasswordRepositoryImpl({required ForgotPasswordDataSource forgotPasswordDataSource})
    : _forgotPasswordDataSource = forgotPasswordDataSource;

  final ForgotPasswordDataSource _forgotPasswordDataSource;

  @override
  Future<void> forgotPassword({required String email}) async {
    await _forgotPasswordDataSource.forgotPassword(email: email);
  }
}
