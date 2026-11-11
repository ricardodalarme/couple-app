import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/data/data_sources/capsules_data_source.dart';
import 'package:flutter_bloc_starter/features/capsules/data/repositories/capsules_repository.dart';
import 'package:flutter_bloc_starter/features/capsules/presentation/capsules/cubit/capsules_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:network/network.dart';

class CapsulesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<CapsulesDataSource>(
      () => CapsulesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<CapsulesRepository>(
      () => CapsulesRepository(
        dataSource: injector.get<CapsulesDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<CapsulesCubit>(
      () => CapsulesCubit(capsulesRepository: injector.get<CapsulesRepository>()),
    );
}
