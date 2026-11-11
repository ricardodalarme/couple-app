import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/love_style_data_source.dart';
import 'package:flutter_bloc_starter/features/love_style/data/data_sources/love_style_local_data_source.dart';
import 'package:flutter_bloc_starter/features/love_style/data/repositories/love_style_repository.dart';
import 'package:flutter_bloc_starter/features/love_style/presentation/exercise/cubit/love_style_cubit.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class LoveStyleInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<LoveStyleDataSource>(
      () => LoveStyleDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<LoveStyleLocalDataSource>(
      () => LoveStyleLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<LoveStyleRepository>(
      () => LoveStyleRepository(
        dataSource: injector.get<LoveStyleDataSource>(),
        localDataSource: injector.get<LoveStyleLocalDataSource>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<LoveStyleCubit>(
      () => LoveStyleCubit(
        repository: injector.get<LoveStyleRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
      ),
    );
}
