import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/gifts/data/data_sources/gifts_data_source.dart';
import 'package:flutter_bloc_starter/features/gifts/data/repositories/gifts_repository.dart';
import 'package:flutter_bloc_starter/features/gifts/presentation/gifts/cubit/gifts_cubit.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:network/network.dart';

class GiftsInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<GiftsDataSource>(
      () => GiftsDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<GiftsRepository>(
      () => GiftsRepository(
        dataSource: injector.get<GiftsDataSource>(),
        togetherRepository: injector.get<TogetherRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<GiftsCubit>(
      () => GiftsCubit(giftsRepository: injector.get<GiftsRepository>()),
    );
}
