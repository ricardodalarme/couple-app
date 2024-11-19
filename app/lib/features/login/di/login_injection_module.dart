import 'package:core/core.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/login/presentation/bloc/login_bloc.dart';

class LoginInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerFactory<LoginBloc>(
      () => LoginBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    );
}
