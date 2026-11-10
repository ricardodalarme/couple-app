import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/data_sources/together_data_source.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/logistics/cubit/logistics_cubit.dart';
import 'package:flutter_bloc_starter/features/together/presentation/together/cubit/together_cubit.dart';
import 'package:network/network.dart';

class TogetherInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<TogetherDataSource>(
      () => TogetherDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<TogetherRepository>(
      () => TogetherRepository(dataSource: injector.get<TogetherDataSource>()),
    )
    ..registerFactory<TogetherCubit>(
      () => TogetherCubit(pairingRepository: injector.get<PairingRepository>()),
    )
    ..registerFactory<LogisticsCubit>(
      () => LogisticsCubit(
        togetherRepository: injector.get<TogetherRepository>(),
        profileRepository: injector.get<ProfileRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
      ),
    );
}
