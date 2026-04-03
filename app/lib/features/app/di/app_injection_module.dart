import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

class AppInjectionModule implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) =>
      injector..registerLazySingleton<AppCubit>(
        () => AppCubit(
          authenticationRepository: injector.get<AuthenticationRepository>(),
          settingsRepository: injector.get<SettingsRepository>(),
        ),
      );
}
