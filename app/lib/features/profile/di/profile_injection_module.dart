import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:network/network.dart';

class ProfileInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(profileDataSource: injector.get<ProfileDataSource>()),
    );
}
