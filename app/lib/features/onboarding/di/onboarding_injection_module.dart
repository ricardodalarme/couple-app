import 'dart:async';

import 'package:common/common.dart';
import 'package:quickstart_flutter_bloc/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:quickstart_flutter_bloc/features/settings/domain/repositories/settings_repository.dart';

class OnboardingInjectionModule implements InjectionModule {
  @override
  FutureOr<void> registerDependencies({required Injector injector}) {
    injector.registerFactory<OnboardingCubit>(
      () => OnboardingCubit(
        settingsRepository: injector.get<SettingsRepository>(),
      ),
    );
  }
}
