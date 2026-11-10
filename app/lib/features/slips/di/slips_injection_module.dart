import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/data_sources/slip_local_data_source.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/quick_slip/cubit/quick_slip_cubit.dart';
import 'package:flutter_bloc_starter/features/slips/presentation/slips/cubit/slips_list_cubit.dart';
import 'package:network/network.dart';
import 'package:preferences_service/preferences_service.dart';

class SlipsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SlipDataSource>(() => SlipDataSource(client: injector.get<GQLClient>()))
    ..registerLazySingleton<SlipLocalDataSource>(
      () => SlipLocalDataSource(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<SlipRepository>(
      () => SlipRepository(
        slipDataSource: injector.get<SlipDataSource>(),
        localDataSource: injector.get<SlipLocalDataSource>(),
      ),
    )
    ..registerFactory<SlipsListCubit>(
      () => SlipsListCubit(slipRepository: injector.get<SlipRepository>()),
    )
    ..registerFactory<QuickSlipCubit>(
      () => QuickSlipCubit(slipRepository: injector.get<SlipRepository>()),
    );
}
