import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/authentication/presentation/sign_in/cubit/sign_in_cubit.dart';

class AuthenticationInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AuthenticationService>(AuthenticationService.new)
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(authenticationService: injector.get<AuthenticationService>()),
    )
    ..registerFactory<SignInCubit>(
      () => SignInCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
