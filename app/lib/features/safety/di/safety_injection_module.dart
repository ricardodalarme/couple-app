import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/help_lines_repository.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/safe_mode_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/help_lines/cubit/help_lines_cubit.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/safe_mode/cubit/safe_mode_cubit.dart';
import 'package:preferences_service/preferences_service.dart';

class SafetyInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<HelpLinesRepository>(HelpLinesRepository.new)
    ..registerLazySingleton<SafeModeRepository>(
      () => SafeModeRepository(preferencesService: injector.get<PreferencesService>()),
    )
    ..registerLazySingleton<SafeModeCubit>(
      () => SafeModeCubit(repository: injector.get<SafeModeRepository>()),
    )
    ..registerFactory<HelpLinesCubit>(
      () => HelpLinesCubit(repository: injector.get<HelpLinesRepository>()),
    );
}
