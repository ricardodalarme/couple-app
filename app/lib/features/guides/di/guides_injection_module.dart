import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/guide_session.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/guides_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/data_sources/guides_local_data_source.dart';
import 'package:flutter_bloc_starter/features/guides/data/repositories/guides_repository.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/hub/cubit/guides_cubit.dart';
import 'package:flutter_bloc_starter/features/guides/presentation/viewer/cubit/guide_cubit.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class GuidesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<GuidesDataSource>(
      () => GuidesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<GuidesLocalDataSource>(
      () => GuidesLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<GuideSession>(GuideSession.new)
    ..registerLazySingleton<GuidesRepository>(
      () => GuidesRepository(
        dataSource: injector.get<GuidesDataSource>(),
        localDataSource: injector.get<GuidesLocalDataSource>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<GuidesCubit>(
      () => GuidesCubit(
        repository: injector.get<GuidesRepository>(),
        plusRepository: injector.get<PlusRepository>(),
      ),
    )
    ..registerFactory<GuideCubit>(
      () => GuideCubit(
        repository: injector.get<GuidesRepository>(),
        plusRepository: injector.get<PlusRepository>(),
        session: injector.get<GuideSession>(),
      ),
    );
}
