import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/app/presentation/bloc/app_bloc.dart';
import 'package:quickstart_flutter_bloc/features/authentication/data/repositories/authentication_repository.dart';

class AppInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerFactory<AppBloc>(
      () => AppBloc(authenticationRepository: injector.get<AuthenticationRepository>()),
    );
}
