import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

class OnboardingCubit({required final SettingsRepository _settingsRepository}) extends Cubit<int> {
  this : super(0);

  void onPageChanged(int page) => emit(page);

  Future<void> onCompleted() async {
    final settings = _settingsRepository.get();
    final newSettings = settings.copyWith(hasOnboarded: true);
    await _settingsRepository.save(newSettings);
  }
}
