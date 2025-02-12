import 'dart:async';

import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/models/token_local.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationDataSource loginDataSource,
    required TokenLocalDataSource tokenLocalDataSource,
    required Mapper<MutationLoginlogin, TokenLocal> tokenLocalMapper,
  }) : _loginDataSource = loginDataSource,
       _tokenLocalDataSource = tokenLocalDataSource,
       _tokenLocalMapper = tokenLocalMapper;

  final AuthenticationDataSource _loginDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;
  final Mapper<MutationLoginlogin, TokenLocal> _tokenLocalMapper;

  final StreamController<bool> _authenticationStreamController = StreamController<bool>.broadcast();

  @override
  Stream<bool> get isAuthenticated => _authenticationStreamController.stream;

  @override
  void dispose() {
    _authenticationStreamController.close();
  }

  @override
  Future<void> checkAuthenticationStatus() async {
    final TokenLocal? token = await _tokenLocalDataSource.get();
    _authenticationStreamController.add(!_hasTokenExpired(token));
  }

  bool _hasTokenExpired(TokenLocal? token) =>
      token == null || token.expires.isBefore(DateTime.now());

  @override
  Future<void> logInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final MutationLoginlogin response = await _loginDataSource.logInWithUsernameAndPassword(
        username: username,
        password: password,
      );

      final TokenLocal localToken = _tokenLocalMapper.map(response);
      await _tokenLocalDataSource.save(localToken);

      _authenticationStreamController.add(true);
    } catch (_) {
      _authenticationStreamController.add(false);
      await _tokenLocalDataSource.delete();
      rethrow;
    }
  }

  @override
  Future<void> logInWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logInWithFacebook() async {
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    _authenticationStreamController.add(false);
    await _tokenLocalDataSource.delete();
  }
}
