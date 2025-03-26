import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/signup_data_source.dart';

class SignupRepository {
  const SignupRepository({required SignupDataSource signupDataSource})
    : _signupDataSource = signupDataSource;

  final SignupDataSource _signupDataSource;

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
