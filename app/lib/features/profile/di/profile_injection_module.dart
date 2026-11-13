import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/data_sources/remote/profile_data_source.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/profile/cubit/profile_settings_cubit.dart';
import 'package:flutter_bloc_starter/features/profile/presentation/setup/cubit/profile_setup_cubit.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:network/network.dart';

class ProfileInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<ProfileDataSource>(
      () => ProfileDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(profileDataSource: injector.get<ProfileDataSource>()),
    )
    ..registerFactory<ProfileSetupCubit>(
      () => ProfileSetupCubit(
        profileRepository: injector.get<ProfileRepository>(),
        settingsRepository: injector.get<SettingsRepository>(),
      ),
    )
    ..registerFactory<ProfileSettingsCubit>(
      () => ProfileSettingsCubit(
        profileRepository: injector.get<ProfileRepository>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
        settingsRepository: injector.get<SettingsRepository>(),
      ),
    );
}
