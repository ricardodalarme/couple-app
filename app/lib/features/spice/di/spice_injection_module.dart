import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/plus/data/repositories/plus_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/spice/data/data_sources/remote/spice_data_source.dart';
import 'package:flutter_bloc_starter/features/spice/data/repositories/spice_repository.dart';
import 'package:flutter_bloc_starter/features/spice/presentation/spice/cubit/spice_cubit.dart';
import 'package:network/network.dart';

class SpiceInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SpiceDataSource>(
      () => SpiceDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<SpiceRepository>(
      () => SpiceRepository(
        dataSource: injector.get<SpiceDataSource>(),
        profileRepository: injector.get<ProfileRepository>(),
        safeModeRepository: injector.get<SafeModeRepository>(),
        plusRepository: injector.get<PlusRepository>(),
      ),
    )
    ..registerFactory<SpiceCubit>(
      () => SpiceCubit(spiceRepository: injector.get<SpiceRepository>()),
    );
}
