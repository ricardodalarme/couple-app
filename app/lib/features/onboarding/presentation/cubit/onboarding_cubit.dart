import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/settings/data/models/settings.dart';
import 'package:flutter_bloc_starter/features/settings/data/repositories/settings_repository.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(0);

  final SettingsRepository _settingsRepository;

  void onPageChanged(int page) => emit(page);

  Future<void> onCompleted() async {
    final Settings settings = _settingsRepository.get();
    final Settings newSettings = settings.copyWith(hasOnboarded: true);
    await _settingsRepository.save(newSettings);
  }
}
