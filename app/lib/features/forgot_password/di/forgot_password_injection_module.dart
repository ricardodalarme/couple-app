import 'package:core/core.dart';
import 'package:network/network.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/data_sources/forgot_password_data_source.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/data/repositories/forgot_password_repository.dart';
import 'package:quickstart_flutter_bloc/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';

class ForgotPasswordInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) =>
      injector
        ..registerLazySingleton<ForgotPasswordDataSource>(
          () => ForgotPasswordDataSource(graphlQLClient: injector.get<GQLClient>()),
        )
        ..registerLazySingleton<ForgotPasswordRepository>(
          () => ForgotPasswordRepository(
            forgotPasswordDataSource: injector.get<ForgotPasswordDataSource>(),
          ),
        )
        ..registerFactory<ForgotPasswordBloc>(
          () => ForgotPasswordBloc(
            forgotPasswordRepository: injector.get<ForgotPasswordRepository>(),
          ),
        );
}
