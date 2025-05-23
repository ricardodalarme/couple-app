import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/data_sources/change_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/change_password/data/repositories/change_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/change_password/presentation/bloc/change_password_bloc.dart';

class ChangePasswordInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ChangePasswordDataSource>(
      () => ChangePasswordDataSource(graphlQLClient: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<ChangePasswordRepository>(
      () => ChangePasswordRepository(
        changePasswordDataSource: injector.get<ChangePasswordDataSource>(),
      ),
    )
    ..registerFactory<ChangePasswordBloc>(
      () => ChangePasswordBloc(changePasswordRepository: injector.get<ChangePasswordRepository>()),
    );
}
