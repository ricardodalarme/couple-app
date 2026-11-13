import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/local/support_local_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/data_sources/remote/support_data_source.dart';
import 'package:flutter_bloc_starter/features/help/data/repositories/support_repository.dart';
import 'package:flutter_bloc_starter/features/help/data/services/support_app_version_service.dart';
import 'package:flutter_bloc_starter/features/help/presentation/help/cubit/help_hub_cubit.dart';
import 'package:flutter_bloc_starter/features/help/presentation/support/cubit/support_cubit.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class HelpInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SupportDataSource>(
      () => SupportDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<SupportLocalDataSource>(
      () => SupportLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<SupportAppVersionService>(SupportAppVersionService.new)
    ..registerLazySingleton<SupportRepository>(
      () => SupportRepository(
        dataSource: injector.get<SupportDataSource>(),
        localDataSource: injector.get<SupportLocalDataSource>(),
      ),
    )
    ..registerFactory<HelpHubCubit>(
      () => HelpHubCubit(
        repository: injector.get<SupportRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<SupportCubit>(
      () => SupportCubit(
        repository: injector.get<SupportRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
        appVersionService: injector.get<SupportAppVersionService>(),
      ),
    );
}
