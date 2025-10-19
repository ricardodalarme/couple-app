import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/mutations/generated/Login.graphql.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/mappers/login_response_to_token_mapper.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/models/token.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/bloc/login_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/bloc/signup_bloc.dart';
import 'package:secure_storage_service/secure_storage_service.dart';

class AuthenticationInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AuthenticationDataSource>(
      () => AuthenticationDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<TokenLocalDataSource>(
      () => TokenLocalDataSource(storage: injector.get<SecureStorageService>()),
    )
    ..registerFactory<Mapper<MutationLoginlogin, Token>>(LoginResponseToTokenMapper.new)
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(
        tokenLocalMapper: injector.get<Mapper<MutationLoginlogin, Token>>(),
        loginDataSource: injector.get<AuthenticationDataSource>(),
        tokenLocalDataSource: injector.get<TokenLocalDataSource>(),
      ),
    )
    ..registerFactory<LoginBloc>(
      () => LoginBloc(authenticationRepository: injector.get<AuthenticationRepository>()),
    )
    ..registerFactory<SignupBloc>(
      () => SignupBloc(authenticationRepository: injector.get<AuthenticationRepository>()),
    )
    ..registerFactory<ForgotPasswordBloc>(
      () => ForgotPasswordBloc(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
