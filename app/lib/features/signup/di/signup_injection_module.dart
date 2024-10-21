import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/data_sources/signup_data_source.dart';
import 'package:quickstart_flutter_bloc/features/signup/data/repositories/signup_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/signup/domain/repositories/signup_repository.dart';
import 'package:quickstart_flutter_bloc/features/signup/presentation/bloc/signup_bloc.dart';

class SignupInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SignupDataSource>(
      () => SignupDataSourceImpl(
        graphlQLClient: injector.get<GQLClient>(),
      ),
    )
    ..registerLazySingleton<SignupRepository>(
      () => SignupRepositoryImpl(
        signupDataSource: injector.get<SignupDataSource>(),
      ),
    )
    ..registerFactory<SignupBloc>(
      () => SignupBloc(
        authenticationRepository: injector.get<AuthenticationRepository>(),
        signupRepository: injector.get<SignupRepository>(),
      ),
    );
}
