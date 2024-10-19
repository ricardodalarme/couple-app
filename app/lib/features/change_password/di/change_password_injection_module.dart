import 'dart:async';

import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/change_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/repositories/change_password_repository_impl.dart';
import 'package:quickstart_flutter_bloc/features/change_password/domain/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';

class ChangePasswordInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector
      ..registerLazySingleton<ChangePasswordDataSource>(
        () => ChangePasswordDataSourceImpl(
          graphlQLClient: injector.get<GQLClient>(),
        ),
      )
      ..registerLazySingleton<ChangePasswordRepository>(
        () => ChangePasswordRepositoryImpl(
          changePasswordDataSource: injector.get<ChangePasswordDataSource>(),
        ),
      )
      ..registerFactory<ChangePasswordBloc>(
        () => ChangePasswordBloc(
          changePasswordRepository: injector.get<ChangePasswordRepository>(),
        ),
      );
  }
}
