import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/safety/data/repositories/help_lines_repository.dart';
import 'package:flutter_bloc_starter/features/safety/presentation/help_lines/cubit/help_lines_cubit.dart';

class SafetyInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<HelpLinesRepository>(HelpLinesRepository.new)
    ..registerFactory<HelpLinesCubit>(
      () => HelpLinesCubit(repository: injector.get<HelpLinesRepository>()),
    );
}
