import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/authentication_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/data_sources/token_local_data_source.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/presentation/signup/cubit/signup_cubit.dart';
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
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(
        loginDataSource: injector.get<AuthenticationDataSource>(),
        tokenLocalDataSource: injector.get<TokenLocalDataSource>(),
      ),
    )
    ..registerFactory<LoginCubit>(
      () => LoginCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    )
    ..registerFactory<SignupCubit>(
      () => SignupCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    )
    ..registerFactory<ForgotPasswordCubit>(
      () => ForgotPasswordCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
