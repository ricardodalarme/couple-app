import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/app/presentation/cubit/app_cubit.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/reminders/data/services/reminder_sync_service.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';
import 'package:flutter_bloc_starter/features/slips/data/repositories/slip_repository.dart';

class AppInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) =>
      injector..registerLazySingleton<AppCubit>(
        () => AppCubit(
          authenticationRepository: injector.get<AuthenticationRepository>(),
          profileRepository: injector.get<ProfileRepository>(),
          settingsRepository: injector.get<SettingsRepository>(),
          slipRepository: injector.get<SlipRepository>(),
          reminderSyncService: injector.get<ReminderSyncService>(),
        ),
      );
}
