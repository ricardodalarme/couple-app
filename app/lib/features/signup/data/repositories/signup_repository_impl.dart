import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/signup_data_source.dart';
import 'package:quickstart_flutter_bloc/features/signup/domain/repositories/signup_repository.dart';

class SignupRepositoryImpl implements SignupRepository {
  const SignupRepositoryImpl({required SignupDataSource signupDataSource})
    : _signupDataSource = signupDataSource;

  final SignupDataSource _signupDataSource;

  @override
  Future<void> signup({
    required String username,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    await _signupDataSource.signup(
      username: username,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }
}
