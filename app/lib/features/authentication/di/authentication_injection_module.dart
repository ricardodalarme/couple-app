import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/login/cubit/login_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/signup/cubit/signup_cubit.dart';

class AuthenticationInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AuthenticationService>(AuthenticationService.new)
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(authenticationService: injector.get<AuthenticationService>()),
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
