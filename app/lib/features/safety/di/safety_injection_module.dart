import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:preferences_service/preferences_service.dart';

class SafetyInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<SafeModeRepository>(
      () => SafeModeRepository(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<SafeModeCubit>(
      () => SafeModeCubit(repository: injector.get<SafeModeRepository>()),
    );
}
