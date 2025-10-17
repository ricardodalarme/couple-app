import 'dart:async';

import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/mappers/login_response_mapper.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/models/token.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationDataSource loginDataSource,
    required TokenLocalDataSource tokenLocalDataSource,
  }) : _authenticationDataSource = loginDataSource,
       _tokenLocalDataSource = tokenLocalDataSource;

  final AuthenticationDataSource _authenticationDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;

  final StreamController<bool> _authenticationStreamController = StreamController<bool>.broadcast();

  Stream<bool> get isAuthenticated => _authenticationStreamController.stream;

  void dispose() {
    _authenticationStreamController.close();
  }

  Future<void> checkAuthenticationStatus() async {
    final Token? token = await _tokenLocalDataSource.get();
    final bool isAuthenticated = token != null && !_hasTokenExpired(token);
    _authenticationStreamController.add(isAuthenticated);
  }

  bool _hasTokenExpired(Token token) => token.expires.isBefore(DateTime.now());

  Future<void> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final MutationLoginlogin response = await _authenticationDataSource
          .logInWithUsernameAndPassword(username: username, password: password);

      await _tokenLocalDataSource.save(response.toModel());

      _authenticationStreamController.add(true);
    } catch (_) {
      _authenticationStreamController.add(false);
      await _tokenLocalDataSource.delete();
      rethrow;
    }
  }

  Future<void> logInWithGoogle() {
    throw UnimplementedError();
  }

  Future<void> logInWithFacebook() {
    throw UnimplementedError();
  }

  Future<void> logOut() async {
    _authenticationStreamController.add(false);
    await _tokenLocalDataSource.delete();
  }

  Future<void> signup({
    required String username,
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    await _authenticationDataSource.signup(
      username: username,
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );
  }

  Future<void> resetPassword({required String email}) async {
    await _authenticationDataSource.resetPassword(email: email);
  }
}
