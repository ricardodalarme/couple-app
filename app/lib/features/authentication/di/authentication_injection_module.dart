import 'package:authentication_service/authentication_service.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/dev_menu/debug_sign_in/cubit/debug_sign_in_cubit.dart';

class AuthenticationInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<AuthenticationService>(AuthenticationService.new)
    ..registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(authenticationService: injector.get<AuthenticationService>()),
    )
    ..registerFactory<DebugSignInCubit>(
      () => DebugSignInCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
