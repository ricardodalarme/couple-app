import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/app/presentation/cubit/app_cubit.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

class AppInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerFactory<AppCubit>(
      () => AppCubit(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
