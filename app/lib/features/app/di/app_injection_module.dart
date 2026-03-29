import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';

class AppInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerFactory<AppCubit>(
      () => AppCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
